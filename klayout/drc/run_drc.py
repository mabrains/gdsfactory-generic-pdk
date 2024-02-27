# ===================================================================================
# Copyright (c) 2024, Mabrains LLC
# Licensed under the GNU Lesser General Public License, Version 3.0 (the "License");
# you may not use this file except in compliance with the License.

#                    GNU Lesser General Public License
#                       Version 3, 29 June 2007

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published
# by the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
# SPDX-License-Identifier: LGPL-3.0
# ===================================================================================

"""
Run GenericPDK DRC.

Usage:
    run_drc.py (--help| -h)
    run_drc.py (--path=<file_path>) [--table=<table_name>]... [--run_dir=<run_dir_path>]
    [--mp=<num_cores>] [--topcell=<topcell_name>] [--thr=<thr>] [--run_mode=<run_mode>]
    [--verbose] [--no_offgrid] [--macro_gen]

Options:
    --help -h                           Print this help message.
    --path=<file_path>                  The input GDS file path.
    --topcell=<topcell_name>            Topcell name to use.
    --table=<table_name>                Table name to use to run the rule deck.
    --mp=<num_cores>                    Run in parallel to speed up the run. [default: 1]
    --run_dir=<run_dir_path>            Run directory to save all the results [default: pwd]
    --thr=<thr>                         The number of threads used in run.
    --run_mode=<run_mode>               Select allowed modes (flat , deep). [default: flat]
    --no_offgrid                        Turn off OFFGRID checking rules.
    --verbose                           Detailed rule execution log for debugging.
    --macro_gen                         Generating the full rule deck without run.
"""

from docopt import docopt
import logging
import os
import xml.etree.ElementTree as ET
import klayout.db
import glob
from datetime import datetime
from subprocess import check_call
import shutil
import concurrent.futures
import traceback


def get_rules_with_violations(results_database):
    """
    This function will find all the rules that has violated in a database.

    Parameters
    ----------
    results_database : string or Path object
        Path string to the results file

    Returns
    -------
    set
        A set that contains all rules in the database with violations
    """

    mytree = ET.parse(results_database)
    myroot = mytree.getroot()

    all_violating_rules = set()

    for z in myroot[7]:  # myroot[7] : List rules with viloations
        all_violating_rules.add(f"{z[1].text}".replace("'", ""))

    return all_violating_rules


def check_drc_results(results_db_files: list):
    """
    check_drc_results Checks the results db generated from run,
    and report at the end if the DRC run failed or passed.
    This function will exit with 1 if there are violations.

    Parameters
    ----------
    results_db_files : list
        A list of strings that represent paths to results databases of all the DRC runs.
    """

    if len(results_db_files) < 1:
        logging.error("Klayout did not generate any rdb results. Please check run logs")
        exit(1)

    full_violating_rules = set()

    for f in results_db_files:
        violating_rules = get_rules_with_violations(f)
        full_violating_rules.update(violating_rules)

    if len(full_violating_rules) > 0:
        logging.error("Klayout DRC run is not clean.")
        logging.error(f"Violated rules are : {str(full_violating_rules)}\n")
        exit(1)
    else:
        logging.info("Klayout DRC run is clean. GDS has no DRC violations.")


def generate_drc_run_template(drc_dir: str, run_dir: str, run_tables_list: list):
    """
    generate_drc_run_template will generate the template file to run drc in the run_dir path.

    Parameters
    ----------
    drc_dir : str
        Path string to the location where the DRC files would be
        found to get the list of the rule tables.
    run_dir : str
        Absolute path string to the run location where all the run output will be generated.
    deck_name : str, optional
        Name of the rule deck to use for generating the template, by default ""
    run_tables_list : list, optional
        list of target parts of the rule deck, if empty assume all of
        the rule tables found, by default []

    Returns
    -------
    str
        Absolute path to the generated DRC file.
    """
    if len(run_tables_list) < 1:
        all_tables = [
            os.path.basename(f)
            for f in glob.glob(os.path.join(drc_dir, "rule_decks", "*.drc"))
            if "antenna" not in f
            and "density" not in f
            and "main" not in f
            and "layers_def" not in f
            and "tail" not in f
        ]
        deck_name = "main"
    elif len(run_tables_list) == 1:
        deck_name = run_tables_list[0]
        all_tables = ["{}.drc".format(run_tables_list[0])]
    else:
        all_tables = ["{}.drc".format(t) for t in run_tables_list]
        deck_name = "main"

    logging.info(
        f"Generating template with for the following rule tables: {all_tables}"
    )
    logging.info(f"Your run dir located at: {run_dir}")

    all_tables.insert(0, "main.drc")
    all_tables.append("tail.drc")

    # Adding layers_def to run  dir to used in main rule deck
    lyrs_def_path = os.path.join(drc_dir, "rule_decks", "layers_def.drc")
    lyrs_def_loc = os.path.join(run_dir, "layers_def.drc")
    shutil.copyfile(lyrs_def_path, lyrs_def_loc)

    gen_rule_deck_path = os.path.join(run_dir, "{}.drc".format(deck_name))
    with open(gen_rule_deck_path, "wb") as wfd:
        for f in all_tables:
            with open(os.path.join(drc_dir, "rule_decks", f), "rb") as fd:
                shutil.copyfileobj(fd, wfd)

    return gen_rule_deck_path


def get_top_cell_names(gds_path):
    """
    get_top_cell_names get the top cell names from the GDS file.

    Parameters
    ----------
    gds_path : string
        Path to the target GDS file.

    Returns
    -------
    List of string
        Names of the top cell in the layout.
    """
    layout = klayout.db.Layout()
    layout.read(gds_path)
    top_cells = [t.name for t in layout.top_cells()]

    return top_cells


def get_list_of_tables(drc_dir: str):
    """
    get_list_of_tables get the list of available tables in the drc

    Parameters
    ----------
    drc_dir : str
        Path to the DRC folder to get the list of tables from.
    """

    if arguments["--run_mode"] == "flat":
        return [
            os.path.basename(f).replace(".drc", "")
            for f in glob.glob(os.path.join(drc_dir, "rule_decks", "*.drc"))
            if all(
                t not in f for t in ("antenna", "density", "main", "layers_def", "tail")
            )
        ]
    else:
        return [
            os.path.basename(f).replace(".drc", "")
            for f in glob.glob(os.path.join(drc_dir, "rule_decks", "*.drc"))
            if all(
                t not in f
                for t in ("antenna", "density", "main", "layers_def", "split", "tail")
            )
        ]


def get_run_top_cell_name(arguments, layout_path):
    """
    get_run_top_cell_name Get the top cell name to use for running.
    If it's provided by the user, we use the user input.
    If not, we get it from the GDS file.

    Parameters
    ----------
    arguments : dict
        Dictionary that holds the user inputs for the script generated by docopt.
    layout_path : string
        Path to the target layout.

    Returns
    -------
    string
        Name of the topcell to use in run.

    """

    if arguments["--topcell"]:
        topcell = arguments["--topcell"]
    else:
        layout_topcells = get_top_cell_names(layout_path)
        if len(layout_topcells) > 1:
            logging.error(
                "Layout has multiple topcells. Use --topcell to determine which topcell you want."
            )
            exit(1)
        else:
            topcell = layout_topcells[0]

    return topcell


def generate_klayout_switches(arguments, layout_path):
    """
    parse_switches Function that parse all the args from input to prepare switches for DRC run.

    Parameters
    ----------
    arguments : dict
        Dictionary that holds the arguments used by user in the run command.
        This is generated by docopt library.
    layout_path : string
        Path to the layout file that we will run DRC on.

    Returns
    -------
    dict
        Dictionary that represent all run switches passed to klayout.
    """
    switches = dict()

    # No. of threads
    thrCount = 2 if arguments["--thr"] is None else int(arguments["--thr"])
    switches["thr"] = str(int(thrCount))

    if arguments["--run_mode"] not in ["flat", "deep"]:
        logging.error("Allowed klayout modes are (flat , deep) only")
        exit(1)

    if arguments["--verbose"]:
        switches["verbose"] = "true"
    else:
        switches["verbose"] = "false"

    switches["topcell"] = get_run_top_cell_name(arguments, layout_path)
    switches["input"] = layout_path

    return switches


def check_klayout_version():
    """
    check_klayout_version checks klayout version and makes sure it would work with the DRC.
    """
    # ======= Checking Klayout version =======
    klayout_v_ = os.popen("klayout -b -v").read()
    klayout_v_ = klayout_v_.split("\n")[0]
    klayout_v_list = []

    if klayout_v_ == "":
        logging.error("Klayout is not found. Please make sure klayout is installed.")
        exit(1)
    else:
        klayout_v_list = [int(v) for v in klayout_v_.split(" ")[-1].split(".")]

    if len(klayout_v_list) < 1 or len(klayout_v_list) > 3:
        logging.error("Was not able to get klayout version properly.")
        exit(1)
    elif len(klayout_v_list) >= 2 and len(klayout_v_list) <= 3:
        if klayout_v_list[1] < 28 or (
            klayout_v_list[1] == 28 and klayout_v_list[2] <= 3
        ):
            logging.error("Prerequisites at a minimum: KLayout 0.28.4")
            logging.error(
                "Using this klayout version is not supported in this development."
            )
            exit(1)

    logging.info(f"Your Klayout version is: {klayout_v_}")


def check_layout_path(layout_path):
    """
    check_layout_type checks if the layout provided is GDS or OAS. Otherwise,
    kill the process. We only support GDS or OAS now.

    Parameters
    ----------
    layout_path : string
        string that represent the path of the layout.

    Returns
    -------
    string
        string that represent full absolute layout path.
    """

    if not os.path.isfile(layout_path):
        logging.error(
            f"GDS file path {layout_path} provided doesn't exist or not a file."
        )
        exit(1)

    if ".gds" not in layout_path and ".oas" not in layout_path:
        logging.error(
            f"Layout {layout_path} is not in GDSII or OASIS format. Please use gds format."
        )
        exit(1)

    return os.path.abspath(layout_path)


def build_switches_string(sws: dict):
    """
    build_switches_string Build switches string from dictionary.

    Parameters
    ----------
    sws : dict
        Dictionary that holds the Antenna switches.
    """
    return " ".join(f"-rd {k}={v}" for k, v in sws.items())


def run_check(drc_file: str, drc_table: str, path: str, run_dir: str, sws: dict):
    """
    run_antenna_check run DRC check based on DRC file provided.

    Parameters
    ----------
    drc_file : str
        String that has the file full path to run.
    drc_table : str
        str that holds the name of drc table to be run.
    path : str
        String that holds the full path of the layout.
    run_dir : str
        String that holds the full path of the run location.
    sws : dict
        Dictionary that holds all switches that needs to be passed to the antenna checks.

    Returns
    -------
    string
        string that represent the path to the results output database for this run.

    """

    # Using print because of the multiprocessing
    logging.info(
        "Running GENERIC TECH DRC {} checks on design {} on cell {}:".format(
            path, drc_table, sws["topcell"]
        )
    )

    layout_base_name = os.path.basename(path).split(".")[0]
    new_sws = sws.copy()
    report_path = os.path.join(run_dir, f"{layout_base_name}_{drc_table}.lyrdb")

    new_sws["report"] = report_path
    sws_str = build_switches_string(new_sws)
    sws_str += f" -rd table_name={drc_table}"

    run_str = f"klayout -b -r {drc_file} {sws_str}"

    check_call(run_str, shell=True)

    return report_path


def run_parallel_run(
    arguments: dict,
    rule_deck_full_path: str,
    layout_path: str,
    switches: dict,
    drc_run_dir: str,
):
    """
    run_parallel_run run the drc checks as in a multi-processing.

    Parameters
    ----------
    arguments : dict
        Dictionary that holds the arguments passed to the run_drc script.
    rule_deck_full_path : str
        String that holds the path of the rule deck files.
    layout_path : str
        Path to the target layout.
    switches : dict
        Dictionary that holds all the switches that will be passed to klayout run.
    drc_run_dir : str
        Path to the run location.
    """

    # Main rule deck creation for macros purpose only
    macros_option = arguments["--macro_gen"]
    if macros_option:
        drc_file = generate_drc_run_template(rule_deck_full_path, drc_run_dir)
        return 0

    list_rule_deck_files = dict()

    # Run Antenna if required.
    if arguments["--antenna"]:
        drc_path = os.path.join(rule_deck_full_path, "rule_decks", "antenna.drc")
        list_rule_deck_files["antenna"] = drc_path

    # Run Density if required.
    if arguments["--density"]:
        drc_path = os.path.join(rule_deck_full_path, "rule_decks", "density.drc")
        list_rule_deck_files["density"] = drc_path

    if not arguments["--table"]:
        list_of_tables = get_list_of_tables(rule_deck_full_path)
    else:
        list_of_tables = arguments["--table"]

    # Generate run rule deck from template.
    for t in list_of_tables:
        drc_file = generate_drc_run_template(rule_deck_full_path, drc_run_dir, [t])
        list_rule_deck_files[t] = drc_file

    # Run All DRC files.
    list_res_db_files = []
    with concurrent.futures.ThreadPoolExecutor(max_workers=workers_count) as executor:
        future_to_run_name = dict()
        for n in list_rule_deck_files:
            future_to_run_name[
                executor.submit(
                    run_check,
                    list_rule_deck_files[n],
                    n,
                    layout_path,
                    drc_run_dir,
                    switches,
                )
            ] = n

        for future in concurrent.futures.as_completed(future_to_run_name):
            run_name = future_to_run_name[future]
            try:
                list_res_db_files.append(future.result())
            except Exception as exc:
                logging.error("%s generated an exception: %s" % (run_name, str(exc)))
                traceback.print_exc()

    # Check run
    check_drc_results(list_res_db_files)


def run_single_processor(
    arguments: dict,
    rule_deck_full_path: str,
    layout_path: str,
    switches: dict,
    drc_run_dir: str,
):
    """
    run_single_processor run the drc checks as single run.

    Parameters
    ----------
    arguments : dict
        Dictionary that holds the arguments passed to the run_drc script.
    rule_deck_full_path : str
        String that holds the path of the rule deck files.
    layout_path : str
        Path to the target layout.
    switches : dict
        Dictionary that holds all the switches that will be passed to klayout run.
    drc_run_dir : str
        Path to the run location.
    """

    list_res_db_files = []

    # Main rule deck creation for macros purpose only
    macros_option = arguments["--macro_gen"]
    if macros_option:
        drc_file = generate_drc_run_template(rule_deck_full_path, drc_run_dir)
        return 0

    # Generate run rule deck from template.
    if not arguments["--table"]:
        drc_file = generate_drc_run_template(rule_deck_full_path, drc_run_dir)
    else:
        drc_file = generate_drc_run_template(
            rule_deck_full_path, drc_run_dir, arguments["--table"]
        )

    # Run Main DRC
    table_name = arguments["--table"] if arguments["--table"] else ["main"]
    list_res_db_files.append(
        run_check(drc_file, table_name[0], layout_path, drc_run_dir, switches)
    )

    # Check run
    check_drc_results(list_res_db_files)


def main(drc_run_dir: str, arguments: dict):
    """
    main function to run the DRC.

    Parameters
    ----------
    drc_run_dir : str
        String with absolute path of the full run dir.
    arguments : dict
        Dictionary that holds the arguments used by user in the run command.
        This is generated by docopt library.
    """

    # Check gds file existance
    if not os.path.exists(arguments["--path"]):
        file_path = arguments["--path"]
        logging.error(
            f"The input GDS file path {file_path} doesn't exist, please recheck."
        )
        exit(1)

    rule_deck_full_path = os.path.dirname(os.path.abspath(__file__))

    # Check Klayout version
    check_klayout_version()

    # Check if there was a layout provided.
    if not arguments["--path"]:
        logging.error("No provided gds file, please add one")
        exit(1)

    # Check layout type
    layout_path = arguments["--path"]
    layout_path = check_layout_path(layout_path)

    # Get run switches
    switches = generate_klayout_switches(arguments, layout_path)

    if workers_count == 1:
        run_single_processor(
            arguments, rule_deck_full_path, layout_path, switches, drc_run_dir
        )
    else:
        run_parallel_run(
            arguments, rule_deck_full_path, layout_path, switches, drc_run_dir
        )


# ================================================================
# -------------------------- MAIN --------------------------------
# ================================================================


if __name__ == "__main__":
    # arguments
    arguments = docopt(__doc__, version="RUN DRC: 1.0")

    # logs format
    now_str = datetime.utcnow().strftime("drc_run_%Y_%m_%d_%H_%M_%S")

    if (
        arguments["--run_dir"] == "pwd"
        or arguments["--run_dir"] == ""
        or arguments["--run_dir"] is None
    ):
        drc_run_dir = os.path.join(os.path.abspath(os.getcwd()), now_str)
    else:
        drc_run_dir = os.path.abspath(arguments["--run_dir"])

    os.makedirs(drc_run_dir, exist_ok=True)

    logging.basicConfig(
        level=logging.DEBUG,
        handlers=[
            logging.FileHandler(os.path.join(drc_run_dir, f"{now_str}.log")),
            logging.StreamHandler(),
        ],
        format="%(asctime)s | %(levelname)-7s | %(message)s",
        datefmt="%d-%b-%Y %H:%M:%S",
    )

    workers_count = int(arguments["--mp"]) if arguments["--mp"] else os.cpu_count()

    # Calling main function
    main(drc_run_dir, arguments)

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

"""Run GenericPDK LVS.

Usage:
    run_lvs.py (--help| -h)
    run_lvs.py (--layout=<layout_path>) (--netlist=<netlist_path>)
    [--run_dir=<run_dir_path>] [--topcell=<topcell_name>] [--run_mode=<run_mode>]
    [--no_net_names] [--spice_comments] [--net_only] [--no_simplify]
    [--combine_devices] [--top_lvl_pins] [--purge] [--purge_nets] [--verbose]

Options:
    --help -h                           Displays this help message.
    --layout=<layout_path>              Specifies the file path of the input GDS file.
    --netlist=<netlist_path>            Specifies the file path of the input netlist file.
    --run_dir=<run_dir_path>            Run directory to save all the generated results [default: pwd]
    --topcell=<topcell_name>            Specifies the name of the top cell to be used.
    --run_mode=<run_mode>               Selects the allowed KLayout mode. (flat, deep). [default: flat]
    --no_net_names                      Omits net names in the extracted netlist.
    --spice_comments                    Includes netlist comments in the extracted netlist.
    --net_only                          Generates netlist objects only in the extracted netlist.
    --no_simplify                       Disables simplification for both layout and schematic.
    --combine_devices                   Enables device combination for both layout and schematic netlists.
    --top_lvl_pins                      Creates pins for top-level circuits in both layout and schematic netlists.
    --purge                             Removes unused nets from both layout and schematic netlists.
    --purge_nets                        Purges floating nets from both layout and schematic netlists.
    --verbose                           Enables detailed rule execution logs for debugging purposes.
"""

from docopt import docopt
import os
import logging
import klayout.db
from datetime import datetime
from subprocess import check_call


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
            klayout_v_list[1] == 28 and klayout_v_list[2] <= 13
        ):
            logging.error("Prerequisites at a minimum: KLayout 0.28.14")
            logging.error(
                "Using this klayout version is not supported in this development."
            )
            exit(1)

    logging.info(f"Your Klayout version is: {klayout_v_}")


def check_layout_type(layout_path):
    """
    check_layout_type checks if the layout provided is GDS or OAS.
    Otherwise, kill the process. We only support GDS or OAS now.

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
            f"## GDS file path {layout_path} provided doesn't exist or not a file."
        )
        exit(1)

    if ".gds" not in layout_path and ".oas" not in layout_path:
        logging.error(
            f"## Layout {layout_path} is not in GDSII or OASIS format. Please use gds format."
        )
        exit(1)

    return os.path.abspath(layout_path)


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
                "Layout has multiple topcells. Please use --topcell to determine topcell you want."
            )
            exit(1)
        else:
            topcell = layout_topcells[0]

    return topcell


def generate_klayout_switches(arguments, layout_path, netlist_path):
    """
    parse_switches Function that parse all the args from input to prepare switches for LVS run.

    Parameters
    ----------
    arguments : dict
        Dictionary that holds the arguments used by user in the run command.
        This is generated by docopt library.
    layout_path : string
        Path to the layout file that we will run LVS on.
    netlist_path : string
        Path to the netlist file that we will run LVS on.

    Returns
    -------
    dict
        Dictionary that represent all run switches passed to klayout.
    """
    switches = dict()

    if arguments["--run_mode"] in ["flat", "deep"]:
        switches["run_mode"] = arguments["--run_mode"]
    else:
        logging.error("Allowed klayout modes are (flat , deep) only")
        exit(1)

    switches = {
        "no_net_names": "true" if arguments.get("--no_net_names") else "false",
        "spice_comments": "true" if arguments.get("--spice_comments") else "false",
        "net_only": "true" if arguments.get("--net_only") else "false",
        "top_lvl_pins": "true" if arguments.get("--top_lvl_pins") else "false",
        "no_simplify": "true" if arguments.get("--no_simplify") else "false",
        "combine_devices": "true" if arguments.get("--combine_devices") else "false",
        "purge": "true" if arguments.get("--purge") else "false",
        "purge_nets": "true" if arguments.get("--purge_nets") else "false",
        "verbose": "true" if arguments.get("--verbose") else "false",
        "topcell": get_run_top_cell_name(arguments, layout_path),
        "input": os.path.abspath(layout_path),
        "schematic": os.path.abspath(netlist_path)
    }

    return switches


def build_switches_string(sws: dict):
    """
    build_switches_string Build switches string from dictionary.

    Parameters
    ----------
    sws : dict
        Dictionary that holds the Antenna switches.
    """
    return " ".join(f"-rd {k}={v}" for k, v in sws.items())


def check_lvs_results(results_db_files: list):
    """
    check_lvs_results Checks the results db generated from run,
    and report at the end if the LVS run failed or passed.

    Parameters
    ----------
    results_db_files : list
        A list of strings that represent paths to results databases of all the LVS runs.
    """

    if len(results_db_files) < 1:
        logging.error("Klayout did not generate any db results. Please check run logs")
        exit(1)


def run_check(lvs_file: str, path: str, run_dir: str, sws: dict):
    """
    run_check run LVS check.

    Parameters
    ----------
    lvs_file : str
        String that has the file full path to run.
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

    logging.info(
        f'Running GENERIC TECH {lvs_file} checks on design {path} on cell {sws["topcell"]}'
    )

    layout_base_name = os.path.basename(path).split(".")[0]
    new_sws = sws.copy()
    report_path = os.path.join(run_dir, f"{layout_base_name}.lvsdb")
    ext_net_path = os.path.join(run_dir, f"{layout_base_name}.cir")
    new_sws["report"] = report_path
    new_sws["target_netlist"] = ext_net_path

    sws_str = build_switches_string(new_sws)

    run_str = f"klayout -b -r {lvs_file} {sws_str}"
    check_call(run_str, shell=True)

    return report_path


def main(lvs_run_dir: str, arguments: dict):
    """
    main function to run the LVS.

    Parameters
    ----------
    lvs_run_dir : str
        String with absolute path of the full run dir.
    arguments : dict
        Dictionary that holds the arguments used by user in the run command.
        This is generated by docopt library.
    """

    # Check Klayout version
    check_klayout_version()

    # Check layout file existence
    layout_path = arguments["--layout"]
    if not os.path.exists(arguments["--layout"]):
        logging.error(
            f"The input GDS file path {layout_path} doesn't exist, please recheck."
        )
        exit(1)

    # Check layout type
    layout_path = check_layout_type(layout_path)

    # Check netlist file existence
    netlist_path = arguments["--netlist"]
    if not os.path.exists(arguments["--netlist"]):
        logging.error(
            f"The input netlist file path {netlist_path} doesn't exist, please recheck."
        )
        exit(1)

    lvs_rule_deck = os.path.join(
        os.path.dirname(os.path.abspath(__file__)), "generic_tech.lvs"
    )

    # Get run switches
    switches = generate_klayout_switches(arguments, layout_path, netlist_path)

    # Run LVS check
    res_db_files = run_check(lvs_rule_deck, layout_path, lvs_run_dir, switches)

    # Check run
    check_lvs_results(res_db_files)


if __name__ == "__main__":
    # arguments
    arguments = docopt(__doc__, version="RUN LVS: 1.0")

    # logs format
    now_str = datetime.utcnow().strftime("lvs_run_%Y_%m_%d_%H_%M_%S")

    if (
        arguments["--run_dir"] == "pwd"
        or arguments["--run_dir"] == ""
        or arguments["--run_dir"] is None
    ):
        lvs_run_dir = os.path.join(os.path.abspath(os.getcwd()), now_str)
    else:
        lvs_run_dir = os.path.abspath(arguments["--run_dir"])

    os.makedirs(lvs_run_dir, exist_ok=True)

    logging.basicConfig(
        level=logging.DEBUG,
        handlers=[
            logging.FileHandler(os.path.join(lvs_run_dir, "{}.log".format(now_str))),
            logging.StreamHandler(),
        ],
        format="%(asctime)s | %(levelname)-7s | %(message)s",
        datefmt="%d-%b-%Y %H:%M:%S",
    )

    # Calling main function
    main(lvs_run_dir, arguments)

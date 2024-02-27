# ==================================================================================
# SPDX-FileCopyrightText: 2024 Mabrains Company
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
# ==================================================================================

"""
Usage:
  install_tech.py (--tech_path=<tech_path>) (--klayout_home=<klayout_home>) (--python_env=<python_env>)

  -h, --help                     Show help text.
  -v, --version                  Show version.
  --tech_path=<tech_path>        Path of technology will be installed.
  --klayout_home=<klayout_home>  Path of klayout directory will be used.
  --python_env=<python_env>      Path of python environment installed for this tech.
"""

import os
import sys
from glob import glob
import logging
from pathlib import Path
from docopt import docopt


SHELL_TYPES = {
    "bash": ".bashrc",
    "zsh": ".zshrc",
    "fish": ".config/fish/config.fish",
    "csh": ".cshrc",
    "tcsh": ".tcshrc",
}


def detect_shell():
    """
    Detects the type of shell being used.

    Returns:
        tuple: A tuple containing the shell type and its corresponding rc file.
               If the shell type cannot be detected, returns (None, None).
    """
    shell = os.getenv("SHELL")
    for shell_type, rc_file in SHELL_TYPES.items():
        if shell.endswith(shell_type):
            return shell_type, rc_file
    return None, None


def add_line_to_rc(line: str):
    """
    Adds lines to the appropriate rc file for the detected shell type.

    Args:
        line (str): Line to be added.
    """

    shell_type, rc_file = detect_shell()
    if shell_type and rc_file:
        rc_file_path = os.path.expanduser(f"~/{rc_file}")
        with open(rc_file_path, "a") as f:
            f.write(line)
            f.write("\n")
    else:
        logging.error("Couldn't detect the shell system you have")
        logging.info(f"Supported shells are {SHELL_TYPES.keys()}")
        exit(1)


def klayout_env_setup(klayout_home: str, python_env: str):
    """
    Setup some env variables for klayout tech.
    Parameters
    ----------
    klayout_home : str
        Path of klayout directory will be used.
    python_env : str
        Path of python environment installed for this tech.
    Returns
    -------
    None
    """

    # Get python lib path for current env
    env_dir = os.path.abspath(os.path.expanduser(python_env))
    python_path = os.path.join(env_dir, "lib", "python*", "site-packages")
    python_lib = glob(python_path)

    # check existence of python lib
    if len(python_lib) < 1 or not os.path.isdir(python_lib[0]):
        logging.error(f"Python lib path {python_path} doesn't exist, please check")
        exit(1)
    else:
        python_lib = python_lib[0]

    line_to_add = (
        f"alias klayout_generic_pdk='KLAYOUT_HOME={klayout_home} "
        f"KLAYOUT_PYTHONPATH={python_lib} klayout -e'"
    )

    add_line_to_rc(line_to_add)


def check_klayout_version():
    """
    Checks klayout version and makes sure it would work with the PDK.
    """

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
                "Using this klayout version is not supported in this development, please update."
            )
            exit(1)

    logging.info(f"Your Klayout version is: {klayout_v_}")


def make_link(src: str, dest: str, overwrite: bool = True) -> None:
    """
    Function to create a symbolic link.

    Parameters
    ----------
    src : str
        Path to the source file or directory.
    dest : str
        Path to the destination where the symbolic link will be created.
    overwrite : bool, optional
        Whether to overwrite an existing symbolic link (default is True).

    Returns
    -------
    None
    """
    src_path = Path(src)
    dest_path = Path(dest)

    if dest_path.exists() or dest_path.is_symlink():
        logging.info(f"Removing {dest_path} as it already exists")
        os.remove(dest_path)

    try:
        os.symlink(src_path, dest_path, target_is_directory=True)
    except OSError as err:
        logging.error(f"Could not create symlink! for {src_path}, please recheck")
        logging.error(f"Error: {err}")

    logging.info("Symlink created for Klayout-Generic_PDK")
    logging.info(f"From: {src_path}")
    logging.info(f"To:   {dest_path}")


def main(tech_path: str, klayout_home: str, python_env: str):
    """
    Main function to install PDK.

    Parameters
    ----------
    tech_path : str
        Path of the technology to be installed.
    klayout_home : str
        Path of klayout directory will be used.
    python_env : str
        Path of python environment installed for this tech.
    Returns
    -------
    None
    """

    # Check version of klayout
    check_klayout_version()

    # Tech source dir will be installed
    src_tech = os.path.abspath(os.path.expanduser(tech_path))

    # Destination directory for the PDK
    dest_path = os.path.abspath(os.path.expanduser(klayout_home))
    dest_dir = os.path.dirname(dest_path)
    dest_tech = Path(dest_dir)
    dest_tech.mkdir(exist_ok=True, parents=True)

    # Creating symlink to KLayout tech directory
    # Check if paths exist
    if not os.path.isdir(src_tech):
        logging.error(f"Tech path {src_tech} doesn't exist, please check")
        exit(1)

    if not os.path.isdir(dest_tech):
        logging.error(f"Destination path {dest_tech} doesn't exist, please check")
        exit(1)

    make_link(src=src_tech, dest=dest_path)

    # Setup some env variables required for klayout
    klayout_env_setup(
        klayout_home=dest_path,
        python_env=python_env,
    )

    logging.info("Klayout-GenericPDK is installed successfully")


# ================================================================
# -------------------------- MAIN --------------------------------
# ================================================================

if __name__ == "__main__":
    # Parse command line arguments
    arguments = docopt(__doc__, version="TECH-INSTALL: 0.2")

    tech_path = arguments["--tech_path"]
    klayout_home = arguments["--klayout_home"]
    python_env = arguments["--python_env"]

    # Configure logging
    logging.basicConfig(
        level=logging.DEBUG,
        handlers=[
            logging.StreamHandler(),
        ],
        format="%(asctime)s | %(levelname)-7s | %(message)s",
        datefmt="%d-%b-%Y %H:%M:%S",
    )

    # Call main function
    main(tech_path, klayout_home, python_env)

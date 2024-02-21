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
  install_tech.py (--tech_name=<tech_name>) (--tech_path=<tech_path>)

  -h, --help                   Show help text.
  -v, --version                Show version.
  --tech_name=<tech_name>      Name of technology will be installed
  --tech_path=<tech_path>      Path of technology will be installed
"""

import os
import logging
from pathlib import Path
from docopt import docopt


def remove_path_or_dir(dest: Path):
    """
    Function to remove a file or directory.

    Parameters
    ----------
    dest : Path
        Path to the file or directory to be removed.

    Returns
    -------
    None
    """
    if dest.is_dir():
        os.unlink(dest)
    else:
        os.remove(dest)


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

    if not src_path.exists():
        raise ValueError(f"{src} does not exist")

    if dest_path.exists() and not overwrite:
        logging.info(f"{dest} already exists")
        return

    if dest_path.exists() or dest_path.is_symlink():
        logging.info(f"Removing {dest_path} as it already exists")
        remove_path_or_dir(dest_path)

    try:
        os.symlink(src_path, dest_path, target_is_directory=True)
    except OSError as err:
        logging.error("Could not create symlink!")
        logging.error(f"Error: {err}")

    logging.info("Symlink created for Klayout-PDK")
    logging.info(f"From: {src_path}")
    logging.info(f"To:   {dest_path}")


def main(tech_name: str, tech_path: str):
    """
    Main function to install PDK.

    Parameters
    ----------
    tech_name : str
        Name of the technology to be installed.
    tech_path : str
        Path of the technology to be installed.

    Returns
    -------
    None
    """
    # Home directory
    home = Path.home()

    # Destination directory for the PDK
    dest_dir = os.path.join(home, ".klayout", "tech")
    dest_path = Path(dest_dir)
    dest_path.mkdir(exist_ok=True, parents=True)

    # Creating symlink to KLayout tech directory
    dest_tech = os.path.join(dest_dir, tech_name)
    src_tech = os.path.abspath(os.path.expanduser(tech_path))

    # Check if paths exist
    if not os.path.exists(dest_tech) and os.path.isdir(dest_tech):
        logging.error(f"Destination path {dest_tech} doesn't exist, please check")
        exit(1)

    if not os.path.exists(src_tech) and os.path.isdir(src_tech):
        logging.error(f"Tech path {src_tech} doesn't exist, please check")
        exit(1)

    make_link(src=src_tech, dest=dest_tech)


# ================================================================
# -------------------------- MAIN --------------------------------
# ================================================================

if __name__ == "__main__":
    # Parse command line arguments
    arguments = docopt(__doc__, version="TECH-INSTALL: 0.1")

    tech_name = arguments["--tech_name"]
    tech_path = arguments["--tech_path"]

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
    main(tech_name, tech_path)

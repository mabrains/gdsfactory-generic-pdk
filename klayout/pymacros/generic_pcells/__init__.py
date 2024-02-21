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

# =============================================================
# --------------- Pcells Generators-Generic PDK ---------------
# =============================================================

import pya
from generic_pcells.generic_pcells import pcell_generator
from generic_pcells.pcells_setup import get_all_pcells
from generic_pcells.utils import prep_logs, get_valid_selections
from generic_pcells.globals import EXCLUDE_PCELLS, LAYERS, DROP_DN_PARAMS, ORIENTATIONS


class GenericPDK(pya.Library):
    """
    A library containing generic PCells for the PDK.
    """

    def __init__(self):
        """
        Initializes the GenericPDK library.
        """
        super().__init__()

        # Set the description of the library
        self.description = "Generic PDK Pcells"

        # Setup logs for user guidance
        prep_logs()

        # Extract all Generic-PDK methods/components with their parameters
        self.pcell_methods, self.pcell_params = get_all_pcells()

        # Get valid selections that will be used for parameters menus
        all_pcells = list(self.pcell_methods.keys())
        menu_choices = get_valid_selections(all_pcells)

        # Dict that holds some valid menus
        param_choices = {
            "LayerSpec": [""] + LAYERS,
            "orientation": [""] + ORIENTATIONS,
            "cross_section": DROP_DN_PARAMS["cross_sections"],
        }

        # Generate all available PCells
        for pcell_name in all_pcells:
            # Create the PCell declarations
            if pcell_name not in EXCLUDE_PCELLS:
                self.layout().register_pcell(
                    pcell_name,
                    pcell_generator(
                        pcell_name=pcell_name,
                        pcell_methods=self.pcell_methods,
                        pcell_params=self.pcell_params[pcell_name],
                        menu_choices=menu_choices,
                        param_choices=param_choices,
                    ),
                )

        # Register the library with the name "Generic-PDK".
        self.register("Generic-PDK")

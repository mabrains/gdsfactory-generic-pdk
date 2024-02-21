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

import os
import pya
import inspect
import logging
import gdsfactory as gf
from generic_pcells.pcells_setup import (
    get_valid_components,
    update_params,
)
from generic_pcells.utils import (
    map_param_type,
    prep_param_names,
    get_default_val,
    lvs_mk_setup,
)
from generic_pcells.globals import (
    IGNORE_PARAM,
    READONLY_PARAM,
    COMP_FUNC_TYPE,
    NOT_SEL,
    DROP_DN_PARAMS,
)


class pcell_generator(pya.PCellDeclarationHelper):
    """
    Klayout Gdsfactory-GenericPDK Pcells generator
    """

    def __init__(
        self,
        pcell_name: str,
        pcell_methods: dict,
        pcell_params: list,
        menu_choices: dict,
        param_choices: dict,
    ):
        """
        Initializes the PCell generator class.

        Parameters
        ----------
        pcell_name : str
            Name of the current PCell registered.
        pcell_methods : dict
            Holds all methods used in Gdsfactory as PCells.
        pcell_params : list
            Holds all parameters used for each PCell.
        menu_choices : dict
            Holds all valid choices for component parameters.
        param_choices : dict
            Holds some selected choices for parameters.
        """

        # Initialize super class.
        super(pcell_generator, self).__init__()

        # Assign passed arguments as class instance variables
        self.pcell_methods = pcell_methods
        self.pcell_name = pcell_name

        # Rename some keyword arguments depends on their usage
        self.pcell_params = prep_param_names(pcell_params)

        # Get parameters available for each PCell
        self.params_names = self.pcell_params["param_name"]

        # Define a list to hold PCellParameterDeclaration for all parameters used for KLayout PCell
        self.param_values = list()

        # Creation of KLayout GUI parameters for each PCell
        for param in self.params_names:
            # Get parameter function that holds all information
            param_val = self.pcell_params["param_func"][param]
            # Get used default parameter value
            param_def = get_default_val(param_val, pcell_name)
            # Map type of the parameter to a proper KLayout type
            klayout_param_type = map_param_type(param_val)
            # Ignore some parameters that couldn't be used in GUI,
            # like parameters that require predefined functions
            hidden_param = param in IGNORE_PARAM
            # Read-only for some parameters that couldn't be used in GUI
            read_only_param = param in READONLY_PARAM

            # Set klayout pcell parameter
            if param_def:
                klayout_param = self.param(
                    name=str(param),
                    value_type=klayout_param_type,
                    description=str(param),
                    default=param_def,
                    hidden=hidden_param,
                    readonly=read_only_param,
                )
            else:
                def_val = "" if klayout_param_type == 2 else 0
                klayout_param = self.param(
                    name=str(param),
                    value_type=klayout_param_type,
                    description=str(param),
                    default=def_val,
                    readonly=read_only_param,
                    hidden=hidden_param,
                )
            # append parameter values
            self.param_values.append(klayout_param)
            # prepare valid choices for current parameter
            for comp_str in COMP_FUNC_TYPE:
                if comp_str in str(param_val):
                    param_choices[comp_str] = get_valid_components(param, menu_choices)

            # Generating dropdown menus for parameters choices
            self.gen_dropdown_menus(param, klayout_param, param_val, param_choices)

    def display_text_impl(self):
        """
        Provides a descriptive text for the cell.
        """
        return f"{self.pcell_name}"

    def produce_impl(self):
        """
        Produces the KLayout PCell.
        """
        # Current PCell parameters names and values as dict
        params = dict(zip(self.params_names, self._param_values))
        # Drop unwanted parameters we have ignored before
        params = {k: v for k, v in params.items() if k not in IGNORE_PARAM}
        # Update current PCell with entered values
        params = update_params(
            params=params,
            pcell_methods=self.pcell_methods,
            pcell_params=self.pcell_params,
        )
        # Generate PCell KLayout cell
        self.gen_pcell(params)

    def gen_pcell(self, params: dict):
        """
        Writes KLayout cell from gdsfactory cell.

        Parameters
        ----------
        params : dict
            Passed arguments of the generated PCell.
        """
        # Clear gdsfactory cache to be able to reload components without changing their name
        gf.clear_cache()
        # Some info logs
        logging.info(f"pcell-name: {self.pcell_name}")
        logging.debug(f"pcell-function: {self.pcell_methods[self.pcell_name]}")
        logging.info(f"pcell-params: {params}")

        # Generate selected PCells with updated parameters
        try:
            self.gf_cell = self.pcell_methods[self.pcell_name](**params)
            if self.gf_cell:
                # Convert gdsfactory cell to KLayout cell then write it
                klayout_pcell = self.gf_to_pya(self.gf_cell, self.pcell_name)
                # Insertion of KLayout PCell
                write_cells = pya.CellInstArray(
                    klayout_pcell.cell_index(),
                    pya.Trans(pya.Point(0, 0)),
                    pya.Vector(0, 0),
                    pya.Vector(0, 0),
                    1,
                    1,
                )
                self.cell.insert(write_cells)
                self.cell.flatten(1)
        except Exception as e:
            raise Exception(
                (
                    "Failed generation of PCell with passed parameters.",
                    f"Got an exception {e}, please recheck",
                )
            )

    def gf_to_pya(self, component: gf.Component, device_name: str):
        """
        Generates KLayout cell from gdsfactory cell.

        Parameters
        ----------
        component : gf.Component
            Gdsfactory component.
        device_name : str
            Name of gdsfactory cell.
        """

        dev_name = str(device_name)

        # Setup for LVS (Adding some markers)
        component = lvs_mk_setup(component, dev_name)

        component.name = dev_name + "_temp"
        component.write_gds(dev_name + "_temp.gds")
        self.layout.read(dev_name + "_temp.gds")
        os.remove(dev_name + "_temp.gds")

        return self.layout.cell(component.name)

    def transformation_from_shape_impl(self):
        """
        Implements the "Create PCell from shape" protocol.
        We use the center of the shape's bounding box to determine the transformation.
        """
        return pya.Trans(self.shape.bbox().center())

    def gen_dropdown_menus(
        self,
        param: str,
        klayout_param: list,
        param_val: inspect.Parameter,
        param_choices: dict,
    ):
        """
        Generates dropdown menus for PCells based on parameter values.

        Parameters:
            param (str): Name of the PCell option/parameter.
            klayout_param (list): KLayout PCell parameter object.
            param_val (inspect.Parameter): GDSFactory PCell parameters read by inspect.
            param_choices (dict): Dictionary holding all valid choices for PCells.
        """

        # Adding dropdown menus for each category
        for key, val in param_choices.items():
            if key in str(param_val) and str(param) not in NOT_SEL:
                self.Type_handle = klayout_param
                [self.Type_handle.add_choice(str(sel), sel) for sel in val]
                break

        # Generate the rest of the parameters menus
        if param in DROP_DN_PARAMS:
            self.Type_handle = klayout_param
            for choice in DROP_DN_PARAMS[param]:
                self.Type_handle.add_choice(str(choice), str(choice))

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

import ast
import inspect
import functools
import logging
from typing import Any
import gdsfactory as gf
import gdsfactory.port as gf_port
from generic_pcells.utils import (
    call_func_by_name,
    clear_params,
)
from generic_pcells.globals import (
    LAYER,
    LAYERS,
)


def get_all_pcells():
    """
    Extract all Gdsfactory methods/Componenets with their parameters

    Parameters
    ----------
        None
    Returns
    -------
        pcell_methods (dict): Holds all methods used in Gdsfactory as a pcells
        pcell_params (dict): Holds all parameters used for each pcell
    """

    # Get members of the gf.components module to extract all pcells
    gf_methods = inspect.getmembers(gf.components)
    pcells = [
        method
        for method in gf_methods
        if inspect.isfunction(method[1]) or isinstance(method[1], functools.partial)
    ]

    # Define some dict will holds pcells paramters/methods
    pcell_params = dict()
    pcell_methods = dict()

    # Iterate over methods to get its parameters
    for pcell in pcells:
        pcell_func_name = pcell[0]
        pcell_func = pcell[1]
        pcell_methods[pcell_func_name] = pcell_func
        # Access each pcell parameters
        func_parameters = inspect.signature(pcell_func).parameters
        # Get just the parameter names
        parameter_names = list(func_parameters.keys())
        pcell_params[pcell_func_name] = {}
        pcell_params[pcell_func_name]["param_name"] = parameter_names
        pcell_params[pcell_func_name]["param_func"] = func_parameters

    return pcell_methods, pcell_params


def get_valid_components(param: str, comp_choices: dict):
    """
    Returns Valid components list for the passed parameters

    Parameters
    ----------
        param (str) : Name of the current parameter used.
        comp_choices (dict): Holds all valid choices for some pcells.
    Returns
    -------
        comp_list (list): Holds all valid gf components used as a pcells
    """
    # Define an empty string as a default component
    comp_list = [""]
    for key, val in comp_choices.items():
        if key == param:
            comp_list += val

    return comp_list


def check_param_type(param_v: Any, param_val: inspect.Parameter, pcell_methods: dict):
    """
    Check type of passed parameters to handle it in a right way.

    Parameters
    ----------
        param_v (Any): Parameter value used for each one for current pcell.
        param_val (str): Holds full parameter definition with value and type
        pcell_methods (dict): Contains all pcells names and its functions.
        pcell_params: (dict): Contains all pcells parameters and its values.
    Returns:
    -------
        is_layer (bool): True if the parameter passed is a layer.
        is_cmp_fn (bool): True if the parameter passed is a function.
    """

    # Check if the parameter is a PDK layer
    is_layer = str(param_v).lower() in LAYERS

    # Check if the parameter is a component to be called by function
    is_cmp_fn = (
        param_v in list(pcell_methods.keys()) and ("Component" in str(param_val))
    ) and "text" not in str(param_val)

    return is_layer, is_cmp_fn


def update_params(params: dict, pcell_methods: dict, pcell_params: dict):
    """
    Update klayout pcells parameters to be passed to gdsfactory components

    Parameters
    ----------
        params (dict): Holds parameter names and its default values for current pcell.
        pcell_methods (dict): Contains all pcells names and its functions.
        pcell_params: (dict): Contains all pcells parameters and its values.
    Returns:
    -------
        params (dict): Holds all parameter names after being updated.
    """

    # Replace kwargs key with the passed componenet parameters
    params = get_kwargs_params(params)

    # Updating param for each pcell with valid type
    for param_k, param_v in params.items():
        # Get actual type for each parameter passed to gf
        try:
            params[param_k] = ast.literal_eval(param_v)
        except (SyntaxError, ValueError):
            # Handle list type written as a string
            if isinstance(param_v, str) and "," in param_v:
                params[param_k] = list(map(str.strip, param_v.split(",")))
            else:
                params[param_k] = param_v

        #  check type of param used for current pcell
        param_val = pcell_params["param_func"].get(param_k)
        is_layer, is_cmp_fn = check_param_type(param_v, param_val, pcell_methods)

        if is_layer:
            # map layer to its corresponding value in the LAYER dictionary
            params[param_k] = LAYER.get(str(param_v).lower(), param_v)

        elif "select_ports" in param_k:
            #  call the specified function with the given parameters
            params[param_k] = call_func_by_name(gf_port, params[param_k])

        elif is_cmp_fn:
            # retrieve the corresponding function from pcell_methods
            params[param_k] = pcell_methods.get(params[param_k], param_v)

        elif "functions_mmi" in param_k or "sections_mmi" in param_k:
            # create a tuple of corresponding MMI from pcell_methods
            if params[param_k]:
                func_val = pcell_methods.get(params[param_k], param_v)
                params[param_k] = (func_val, func_val)

        logging.debug(f"param_name: {param_k}")
        logging.debug(f"param_value: {param_v}")
        logging.debug(f"param_is_layer: {is_layer}")
        logging.debug(f"param_is_comp: {is_cmp_fn}")

    # Remove parameters with invalid input such as empty string or None value
    params = clear_params(params, list(params.keys()), list(params.values()))

    return params


def get_kwargs_params(params: dict):
    """
    Replace kwargs key with the passed component parameters.

    Args:
        params (dict): The dictionary of parameters.

    Returns:
        params (dict): Parameters after updating it with extra args.
    """

    # Get args keys used for current component
    keys_with_args = [key for key in params.keys() if "args" in key]
    # Replace current kwargs with passed args from pcell
    for key in keys_with_args:
        if params[key]:
            kwargs_values = str(params[key]).split(",")
            for kwargs_val in kwargs_values:
                kwargs_values = str(kwargs_val).split("=")
                try:
                    param_name = kwargs_values[0]
                    param_val = kwargs_values[1]
                    params[param_name] = ast.literal_eval(param_val)
                except (SyntaxError, ValueError, IndexError):
                    params[param_name] = kwargs_values
            # Remove the args key, not needed after replacement
            params.pop(key)

    return params

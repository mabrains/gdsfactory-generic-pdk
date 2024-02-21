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

# ================================================================
# --------------- Utils used for Pcells-Generation ---------------
# ================================================================

import pya
import logging
import inspect
import numpy as np
import gdsfactory as gf
from generic_pcells.pdk_layers import LAYER
from generic_pcells.globals import (
    KLAYOUT_TYPES,
    COMP_ALL_SEL,
    COMP_SEL,
    CMP_DIFF_NAME,
    CMP_NAME_SEL,
    PARAMS_KWARGS,
    IGNORE_PARAM,
    CMP_MK_LVS,
    CMP_LEN_MK_LVS,
    CMP_PORT_LVS,
)


def prep_logs():
    """
    Set up logging configuration for logging messages.
    """
    logging.basicConfig(
        level=logging.DEBUG,
        format="%(asctime)s | %(levelname)-7s | %(message)s",
        datefmt="%d-%b-%Y %H:%M:%S",
    )


def call_func_by_name(obj, name: str):
    """
    Get selected function as a method by using its name.

    Parameters
    ----------
        obj (method): The object from which the attribute is to be retrieved.
        name (str) : A string representing the name of the attribute.
    Returns
    -------
        (Any): Depends on the type of the attribute being retrieved.
    """
    # Retrieve and return the method with the specified name
    return getattr(obj, name, None)


def clear_params(params: dict, param_keys: list, param_values: list):
    """
    Remove empty/None parameters from a dictionary.

    Parameters
    ----------
        params (dict): Dictionary containing parameter names and values.
        param_keys (list): List of parameter names.
        param_values (list): List of parameter values.
    Returns
    -------
        params (dict): Dictionary with non-empty parameters.
    """
    none_params = []
    for i in range(len(param_values)):
        # Identify empty or None parameters
        if str(param_values[i]) in ["", "None"]:
            param_values[i] = None
            none_params.append(param_keys[i])
    # Remove identified empty or None parameters
    for none_param in none_params:
        params.pop(none_param)

    return params


def get_valid_selections(all_pcells: list):
    """
    Get valid selections for parameters menus.

    Parameters
    ----------
        all_pcells (list): List of all available pcells.
    Returns
    -------
        comp_choices (dict): Valid selections for parameters menus.
    """
    comp_choices = {}

    # Parameters that accepts all components
    for comp in COMP_ALL_SEL:
        comp_choices[comp] = all_pcells

    # Get list of pcells for some categories
    for comp in COMP_SEL:
        comp_choices[comp] = [item for item in all_pcells if str(item).startswith(comp)]

    # Get list of pcells for some categories with diff name
    for key, val in CMP_DIFF_NAME.items():
        comp_choices[key] = [item for item in all_pcells if str(item).startswith(val)]

    # Get list of pcells for some categories with more one name
    for key, values in CMP_NAME_SEL.items():
        comp_choices[key] = []
        for val in values:
            comp_choices[key].extend(
                [item for item in all_pcells if str(item).startswith(val)]
            )

    return comp_choices


def map_param_type(param_val: inspect.Parameter):
    """
    Determine the type of KLayout parameter used for a selected pcell.

    Parameters
    ----------
        param_val (inspect.Parameter): Parameter information extracted by inspect.
    Returns:
        klayout_param_type (int): KLayout type of the parameter.
    """
    if hasattr(param_val, "annotation"):
        param_type = str(param_val.annotation).lower()
    else:
        param_type = "str"

    klayout_param_type = KLAYOUT_TYPES.get(
        param_type, pya.PCellDeclarationHelper.TypeString
    )

    return klayout_param_type


def prep_param_names(params: dict):
    """
    Clean parameter names for use in GUI.

    Parameters
    ----------
        params (dict): Parameter names for a pcell.
    Returns:
        params (dict): Cleaned parameter names for a pcell.
    """
    # Ignore some parameters that couldn't be used in GUI
    params = {key: value for key, value in params.items() if key not in IGNORE_PARAM}
    # Updating parameter names for pcells with extra args
    # TODO: check rest of comp takes kwargs rather than cross_section/component
    if "kwargs" in params["param_name"]:
        param_names = list(params["param_name"])
        param_func = dict(params["param_func"])
        param_kwargs = [param for param in param_names if param in PARAMS_KWARGS]
        # Passing all kwargs to component if exist (Default option)
        param_kwargs = PARAMS_KWARGS[:1] if len(param_kwargs) > 1 else param_kwargs
        for param in param_kwargs:
            param_names.append(f"{param}_args")
            param_func[f"{param}_args"] = ""
            param_names.remove("kwargs")
            param_func.pop("kwargs")
            params = {
                "param_name": param_names,
                "param_func": param_func,
            }

    return params


def get_default_val(param_val: inspect.Parameter, pcell_name: str):
    """
    Get the default value used for each parameter for a given pcell.

    Parameters
    ----------
        param_val (str): Information related to each parameter.
        pcell_name (str): Name of the current pcell.
    Returns:
        param_def (Any): Default value for the parameter.
    """
    # Get used defauslt parameter value, '' if there is no value.
    if not hasattr(param_val, "default") or param_val is None:
        return 0
    else:
        param_def = param_val.default

    # Make sure that used default value is not empty parameter
    if param_def is inspect.Parameter.empty or isinstance(param_def, type(None)):
        return 0

    # Make sure that used default value is not empty tuple/list
    if isinstance(param_def, (tuple, list)) and all(
        element is None for element in param_def
    ):
        return 0

    # Extract list of function names based on default values
    if "<function" in str(param_def):
        return 0

    # return proper type for default val
    if isinstance(param_def, (bool, int, float)):
        return param_def
    else:
        return str(param_def)


@gf.cell
def add_bbox_mk(component: gf.Component, layer: tuple):
    """
    Adding marker for KLayout cell.

    Parameters
    ----------
    component : gf.Component
        Gdsfactory component.
    layer : tuple
        Layer used for marker.
    """
    # Calculate the bounding box of the component
    c = gf.Component()
    c << component
    # Adding mk for disk
    c << gf.components.bbox(((c.xmin, c.ymin), (c.xmax, c.ymax)), layer=layer)
    return c


@gf.cell
def add_port_mk(component: gf.Component, port_no: int = 2):
    """
    Adding marker for KLayout cell.

    Parameters
    ----------
    component : gf.Component
        Gdsfactory component.
    port_no : int
        Number of added ports for current component.
    """

    # Calculate the bounding box of the component
    c = gf.Component()
    c << component
    # Adding ports
    port_l = 0.02
    if len(component.ports) > 0:
        for _, port in component.ports.items():
            width = port.width if port.width else port_l
            if port.port_type == 'electrical':
                p = c << gf.components.rectangle(size=(0.02, width), layer=LAYER["porte"])
            else:
                p = c << gf.components.rectangle(size=(0.02, width), layer=LAYER["port"])
            if port.orientation == 0:
                p.center = (port.center[0] - 0.01, port.center[1])
            elif port.orientation == 180:
                p.center = (port.center[0] + 0.01, port.center[1])
            elif port.orientation == 90:
                p.rotate(90)
                p.center = (port.center[0], port.center[1] - 0.01)
            elif port.orientation == 270:
                p.rotate(270)
                p.center = (port.center[0], port.center[1] + 0.01)
            else:
                # For undefined orientation
                p.center = port.center
    else:
        # Adding 2 ports as a default nodes
        p1 = c << gf.components.rectangle(size=(port_l, port_l), layer=LAYER["port"])
        p2 = c << gf.components.rectangle(size=(port_l, port_l), layer=LAYER["port"])
        p1.center = (c.xmin, c.center[1])
        p2.center = (c.xmax, c.center[1])
    return c


@gf.cell
def add_core_mk(component: gf.Component, layer: tuple):
    """
    Adding marker for core of KLayout cell.

    Parameters
    ----------
    component : gf.Component
        Gdsfactory component.
    layer : tuple
        Layer used for marker.
    """

    # Calculate the bounding box of the component
    c = gf.Component()
    c << component
    # Get mmi core
    for p in component.polygons:
        if is_regular_shape(p.points):
            c.add_polygon(gf.Polygon(p.points, layer=layer))
    return c


@gf.cell
def lvs_mk_setup(component: gf.Component, dev_name: str):
    """
    Preparing LVS setup for some Pcells (adding markers).

    Parameters
    ----------
    component : gf.Component
        Gdsfactory component.
    dev_name : str
        Name of current loaded pcell.
    """

    # Parent component with all markers
    c = gf.Component()

    # Adding the main cell
    c << component

    # Adding ports for some pcells for LVS purpose
    if dev_name in CMP_PORT_LVS:
        c << add_port_mk(component, CMP_PORT_LVS[dev_name])
    # Adding marker for some pcells for LVS purpose
    if dev_name in CMP_MK_LVS:
        c << add_bbox_mk(component, CMP_MK_LVS[dev_name])
    if dev_name in CMP_LEN_MK_LVS:
        c << add_core_mk(component, CMP_LEN_MK_LVS[dev_name])

    return c


def is_regular_shape(points):
    """
    Check if a given set of points forms a regular shape such as a rectangle or a square.

    Parameters:
        points (array_like): An array-like object containing the coordinates of the points
                             defining the shape. Each row represents a point, and each column
                             represents a coordinate (e.g., [x, y]).

    Returns:
        bool: True if the points form a regular shape (rectangle or square), False otherwise.
    """
    # Convert points to NumPy array for easier manipulation
    points = np.array(points)

    # Calculate side lengths
    side_lengths = np.linalg.norm(
        np.diff(np.vstack((points, points[0])), axis=0), axis=1
    )

    # Make sure it's a regular shape
    if side_lengths.size != 4:
        return False

    # Check if opposite sides have equal lengths
    if (not np.isclose(side_lengths[0], side_lengths[2])) or not np.isclose(
        side_lengths[1], side_lengths[3]
    ):
        return False

    # Get vectors between consecutive points
    expanded_points = np.vstack((points, points[0]))
    vectors = np.diff(expanded_points, axis=0)

    # Calculate dot products of consecutive vectors
    dot_products = np.dot(vectors, vectors.T)

    # Check if all angles are approximately right angles
    if np.count_nonzero(dot_products) == 8:
        return True
    else:
        return False

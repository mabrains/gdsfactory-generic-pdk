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

# Import necessary libraries
import pya
from generic_pcells.pdk_layers import LAYER

# Define KLayout types mapping for PCell variables
# Available types of parameters in klayout
# TypeInt: 0
# TypeDouble: 1
# TypeString: 2
# TypeBoolean: 3
# TypeLayer: 4
# TypeShape: 5
# TypeList: 6
# TypeCallback: 7
# TypeNone: 8
KLAYOUT_TYPES = {
    "float": pya.PCellDeclarationHelper.TypeDouble,  # Map float to TypeDouble
    "<class 'float'>": pya.PCellDeclarationHelper.TypeDouble,
    "float2 ": pya.PCellDeclarationHelper.TypeDouble,
    "float | none": pya.PCellDeclarationHelper.TypeDouble,
    "int | float": pya.PCellDeclarationHelper.TypeDouble,
    "int": pya.PCellDeclarationHelper.TypeInt,  # Map int to TypeInt
    "bool": pya.PCellDeclarationHelper.TypeBoolean,  # Map bool to TypeBoolean
    "<class 'bool'>": pya.PCellDeclarationHelper.TypeBoolean,
    "list": pya.PCellDeclarationHelper.TypeList,  # Map list to TypeList
    "path": pya.PCellDeclarationHelper.TypeShape,  # Map path to TypeShape
    "none": pya.PCellDeclarationHelper.TypeNone,  # Map none to TypeNone
    "str": pya.PCellDeclarationHelper.TypeString,  # Map str to TypeString
}

# Define list of available layers for Gdsfactory-GenericPDK
LAYERS = list(LAYER.keys())

# Define orientations
ORIENTATIONS = [0, 90, 180, 270]

# Define excluded PCell names
EXCLUDE_PCELLS = [
    "component_sequence",
    "extend_port",
    "extend_ports_list",
    "generate_doe",
    "pack_doe",
    "pack_doe_grid",
    "get_cells",
    "grating_taper_points",
    "grating_tooth_points",
    "ellipse_arc",
]

# Define parameters to ignore during PCell generation
IGNORE_PARAM = [
    "text",
    "text_factory",
    "via",
    "vias",
    "heater_vias",
    "hybrid_90deg",
    "detector",
    "extension",
    "cutback",
    "decorator",
    "seal",
    "add_bbox",
]

# Define parameters that are read-only
READONLY_PARAM = [
    "font",
    "neff_w",
    "free_propagation_region_input_function",
    "free_propagation_region_output_function",
]

# Define parameter keywords
PARAMS_KWARGS = [
    "component",
    "cross_section",
]

# Define component function types
COMP_FUNC_TYPE = [
    "Component",
    "function",
]

# Define dropdown parameters for various components
DROP_DN_PARAMS = {
    "cross_sections": [
        "",
        "xs_heater_metal",
        "xs_m1",
        "xs_m2",
        "xs_m3",
        "xs_m3_bend",
        "xs_metal_routing",
        "xs_nc",
        "xs_nc_sc_tip",
        "xs_npp",
        "xs_pin",
        "xs_pn",
        "xs_pn_ge",
        "xs_pn_with_trenches",
        "xs_pn_with_trenches_asymmetric",
        "xs_rc",
        "xs_rc2",
        "xs_rc_bbox",
        "xs_rc_heater_doped",
        "xs_rc_heater_doped_via_stack",
        "xs_rc_with_trenches",
        "xs_sc",
        "xs_sc_auto_widen",
        "xs_sc_heater_doped",
        "xs_sc_heater_doped_via_stack",
        "xs_sc_heater_metal",
        "xs_sc_heater_metal_undercut",
        "xs_sc_nc_tip",
        "xs_sc_no_pins",
        "xs_sc_pins",
        "xs_sc_rc_tip",
        "xs_slot",
    ],
    "parity": ["", -1, 1],
    "polarization": ["", "te", "tm", "dual"],
    "select_ports": [
        "",
        "select_ports_optical",
        "select_ports_electrical",
        "select_ports_placement",
    ],
    "port_type": ["", "electrical", "optical"],
}

# Parameters that accepts all components
COMP_ALL_SEL = [
    "component",
    "left",
    "right",
    "top",
    "bottom",
    "fiducial",
    "unit_cell",
    "marker",
    "arm",
]

# Define components to select based on parameter name
COMP_SEL = [
    "grating_coupler",
    "pad",
    "via_stack",
    "bend",
    "straight",
    "taper",
    "spiral",
    "mzi",
    "crossing45",
    "crossing",
    "greek_cross",
    "ring",
]

# Define excluded dropdown menu items
NOT_SEL = [
    "layers",
    "bbox_layers",
    "open_layers",
    "doping_layers",
    "layers_doping",
    "layer_offsets",
    "bends",
    "ring_cross_sections",
]

# Define different names for certain components
CMP_DIFF_NAME = {
    "splitter": "mmi",
    "combiner": "mmi",
    "reticle": "die",
    "mzm": "mzi_",
    "spol_coh_tx": "coh_tx",
    "spol_coh_rx": "coh_rx",
}

# Define multi selections for certain components
CMP_NAME_SEL = {
    "phase_shifter": ["taper", "straight"],
    "ps_bot": ["taper", "straight"],
    "ps_top": ["taper", "straight"],
    "coupler": ["coupler", "mmi"],
}

CMP_MK_LVS = {
    "mmi1x2": (1, 1),
    "dbr": (1, 5),
    "disk": (1, 8),
    "grating_coupler_elliptical": (1, 9),
    "straight_heater_meander": (47, 4),
    "coupler": (1, 6),
}

CMP_LEN_MK_LVS = {
    "mmi1x2": (1, 2),
    "coupler": (1, 7),
}

CMP_PORT_LVS = {
    "mmi1x2": 3,
    "dbr": 2,
    "grating_coupler_elliptical": 1,
    "disk": 2,
    "coupler": 4,
    "straight_heater_meander": 4,
}

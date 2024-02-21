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

# ==================================================
# --------------- Layers-Generic PDK ---------------
# ==================================================

LAYER = {
    "wg": (1, 0),
    "wgclad": (111, 0),
    "slab150": (2, 0),
    "slab90": (3, 0),
    "deeptrench": (4, 0),
    "ge": (5, 0),
    "undercut": (6, 0),
    "wgn": (34, 0),
    "wgn_clad": (35, 0),
    "n": (20, 0),
    "np": (22, 0),
    "npp": (24, 0),
    "p": (21, 0),
    "pp": (23, 0),
    "ppp": (25, 0),
    "gen": (26, 0),
    "gep": (27, 0),
    "mh": (47, 0),
    "heater_mk": (47, 1),
    "m1": (41, 0),
    "m2": (45, 0),
    "m3": (49, 0),
    "viac": (40, 0),
    "via1": (44, 0),
    "via2": (43, 0),
    "padopen": (46, 0),
    "dicing": (100, 0),
    "no_tile_si": (71, 0),
    "padding": (67, 0),
    "devrec": (68, 0),
    "floorplan": (64, 0),
    "text": (66, 0),
    "port": (1, 10),
    "porte": (1, 11),
    "porth": (70, 0),
    "show_ports": (1, 12),
    "label_optical_io": (201, 0),
    "optical_lbl": (2000, 0),
    "label_settings": (202, 0),
    "te": (203, 0),
    "tm": (204, 0),
    "drc_marker": (205, 0),
    "label_instance": (206, 0),
    "error_marker": (207, 0),
    "error_path": (208, 0),
    "source": (110, 0),
    "monitor": (101, 0),
    "pinrec": (69, 0),
    "mzi_len_mk": (500, 0),
    "wafer": (99999, 0),
}

# =========================================================================================
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
# =========================================================================================

TOP_DIR := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
VENV_RUN_COMMAND = $(TOP_DIR)/pdk_venv/bin/activate

# ======================= 
# ------ ENV SETUP ------ 
# =======================

$(TOP_DIR)/pdk_venv:
	@python3.10 -m venv $(TOP_DIR)/pdk_venv

# Install requirements	
env: $(TOP_DIR)/pdk_venv
	@. $(VENV_RUN_COMMAND); pip install -r requirements.txt 


# Lint python code
lint: | $(CONDA_ENV_PYTHON)
	@$(IN_CONDA_ENV) flake8 .

#================
## DRC Regression
#================

test-DRC-main: | $(CONDA_ENV_PYTHON)
	@$(IN_CONDA_ENV) klayout -v

#================
## LVS Regression
#================
# LVS main testing
test-LVS-main: | $(CONDA_ENV_PYTHON)
	@$(IN_CONDA_ENV) klayout -v

#===================
## PCells Regression
#===================

test-pcells: |  $(CONDA_ENV_PYTHON)
	@$(IN_CONDA_ENV) klayout -v

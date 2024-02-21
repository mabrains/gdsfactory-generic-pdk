v {xschem version=3.1.0 file_version=1.2 

* ===================================================================================
* Copyright (c) 2024, Mabrains LLC
* Licensed under the GNU Lesser General Public License, Version 3.0 (the "License");
* you may not use this file except in compliance with the License.
*
*                    GNU Lesser General Public License
*                       Version 3, 29 June 2007
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU Lesser General Public License as published
* by the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU Lesser General Public License for more details.
*
* You should have received a copy of the GNU Lesser General Public License
* along with this program.  If not, see <https://www.gnu.org/licenses/>.
* SPDX-License-Identifier: LGPL-3.0
* ===================================================================================

}

G {}
K {}
V {}
S {}
E {}
N -110 -80 -50 -80 {
lab=pin1}
N -110 -50 -50 -50 {
lab=pin2}
N 210 -80 310 -80 {
lab=#net1}
N 210 -50 310 -50 {
lab=#net2}
N 650 -80 690 -80 {
lab=#net3}
N 690 -180 690 -80 {
lab=#net3}
N 690 -180 730 -180 {
lab=#net3}
N 650 -50 730 -50 {
lab=#net4}
N 680 -210 730 -210 {
lab=#net5}
N 680 -20 730 -20 {
lab=#net6}
N 540 -210 680 -210 {
lab=#net5}
N 30 -210 100 -210 {
lab=pin1}
N 610 30 670 30 {
lab=#net6}
N 670 -20 670 30 {
lab=#net6}
N 670 -20 680 -20 {
lab=#net6}
N 610 60 710 60 {
lab=pin4}
N 240 30 350 30 {
lab=pin2}
N 240 60 350 60 {
lab=#net7}
N -70 -50 -70 20 {
lab=pin2}
N -70 30 240 30 {
lab=pin2}
N -70 20 -70 30 {
lab=pin2}
N -70 -210 -70 -80 {
lab=pin1}
N -70 -210 30 -210 {
lab=pin1}
N 240 60 240 80 {
lab=#net7}
N 230 80 240 80 {
lab=#net7}
N -130 80 -90 80 {
lab=pin3}
N 1070 -210 1160 -210 {
lab=pin4}
N 1070 -180 1160 -180 {
lab=pin5}
N 990 -30 1080 -30 {
lab=pin4}
N 710 60 1020 60 {
lab=pin4}
N 1020 -30 1020 60 {
lab=pin4}
C {test_cdc.sym} -10 -40 0 0 {name=x1}
C {devices/iopin.sym} -110 -80 0 1 {name=p1 lab=pin1}
C {devices/iopin.sym} -110 -50 0 1 {name=p2 lab=pin2}
C {test_coupler_adiabatic.sym} 350 -40 0 0 {name=x2}
C {test_coupler_broadband.sym} 770 -170 0 0 {name=x3}
C {test_dbr_tapered.sym} 770 -10 0 0 {name=x4}
C {test_grating_coupler_elliptical_lumerical.sym} 140 -190 0 0 {name=x5}
C {test_mmi2x2.sym} 390 70 0 0 {name=x6}
C {test_ring_single_pn.sym} -50 100 0 0 {name=x7}
C {devices/iopin.sym} -130 80 0 1 {name=p3 lab=pin3}
C {devices/iopin.sym} 1160 -210 0 0 {name=p4 lab=pin4}
C {devices/iopin.sym} 1160 -180 0 0 {name=p5 lab=pin5}
C {devices/iopin.sym} 1080 -30 0 0 {name=p6 lab=pin6}

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
N 180 -460 380 -460 {
lab=#net1}
N 380 -460 380 -360 {
lab=#net1}
N 180 -500 420 -500 {
lab=#net2}
N 420 -500 420 -360 {
lab=#net2}
N -260 -460 -180 -460 {
lab=pin1}
N 420 0 420 150 {
lab=#net3}
N 420 150 850 150 {
lab=#net3}
N 1210 110 1630 110 {
lab=#net4}
N 1630 50 1630 110 {
lab=#net4}
N 1670 50 1670 150 {
lab=#net5}
N 1210 150 1670 150 {
lab=#net5}
N 1670 -480 1670 -310 {
lab=pin2}
C {devices/title.sym} -440 350 0 0 {name=l5 author="Mabrains Authors"}
C {../../symbols/polarization_splitter_rotator.sym} -280 -30 0 0 {name=rotator1
width_taper_in1=0.54u
width_taper_in2=0.69u
width_taper_in3=0.83u
length_taper_in1=4.0u
length_taper_in2=44.0u
length_taper_in3=44.0u
width_coupler_top=0.9u
width_coupler_bottom=0.405u
length_coupler=7.0u
gap=0.15u
width_out=0.54u
length_out=14.33u
dy=5.0u
model=polarization_splitter_rotator
spiceprefix=P}
C {../../symbols/polarization_splitter_rotator.sym} 750 580 0 0 {name=rotator3
width_taper_in1=0.54u
width_taper_in2=0.69u
width_taper_in3=0.83u
length_taper_in1=4.0u
length_taper_in2=44.0u
length_taper_in3=44.0u
width_coupler_top=0.9u
width_coupler_bottom=0.405u
length_coupler=7.0u
gap=0.15u
width_out=0.54u
length_out=14.33u
dy=5.0u
model=polarization_splitter_rotator
spiceprefix=P}
C {../../symbols/polarization_splitter_rotator.sym} 850 100 3 0 {name=rotator2
width_taper_in1=0.54u
width_taper_in2=0.69u
width_taper_in3=0.83u
length_taper_in1=4.0u
length_taper_in2=44.0u
length_taper_in3=44.0u
width_coupler_top=0.9u
width_coupler_bottom=0.405u
length_coupler=7.0u
gap=0.15u
width_out=0.54u
length_out=14.33u
dy=5.0u
model=polarization_splitter_rotator
spiceprefix=P}
C {devices/iopin.sym} -256.25 -460 0 1 {name=p2 lab=pin1}
C {../../symbols/polarization_splitter_rotator.sym} 2100 -410 3 1 {name=rotator4
width_taper_in1=0.54u
width_taper_in2=0.69u
width_taper_in3=0.83u
length_taper_in1=4.0u
length_taper_in2=44.0u
length_taper_in3=44.0u
width_coupler_top=0.9u
width_coupler_bottom=0.405u
length_coupler=7.0u
gap=0.15u
width_out=0.54u
length_out=14.33u
dy=5.0u
model=polarization_splitter_rotator
spiceprefix=P}
C {devices/iopin.sym} 1670 -480 3 0 {name=p1 lab=pin2}

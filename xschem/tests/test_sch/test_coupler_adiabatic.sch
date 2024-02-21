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
N -260 -500 -120 -500 {
lab=pin1}
N -260 -450 -120 -450 {
lab=pin2}
N 170 -450 390 -450 {
lab=#net1}
N 390 -450 390 -290 {
lab=#net1}
N 170 -500 450 -500 {
lab=#net2}
N 450 -500 450 -290 {
lab=#net2}
N 390 160 910 160 {
lab=#net3}
N 390 0 390 160 {
lab=#net3}
N 450 0 450 110 {
lab=#net4}
N 450 110 910 110 {
lab=#net4}
N 1200 110 1670 110 {
lab=#net5}
N 1670 -20 1670 110 {
lab=#net5}
N 1730 -20 1730 160 {
lab=#net6}
N 1200 160 1730 160 {
lab=#net6}
N 1670 -470 1670 -310 {
lab=#net7}
N 1730 -470 1730 -310 {
lab=#net8}
C {devices/title.sym} -440 350 0 0 {name=l5 author="Mabrains Authors"}
C {../../symbols/coupler_adiabatic.sym} -280 -30 0 0 {name=coupler_adiabatic1
length1=20.0u
length2=50.0u
length3=30.0u
wg_sep=1.0u
input_wg_sep=3.0u
output_wg_sep=3.0u
dw=0.1u
model=coupler_adiabatic
spiceprefix=P}
C {../../symbols/coupler_adiabatic.sym} 750 580 0 0 {name=coupler_adiabatic3
length1=20.0u
length2=50.0u
length3=30.0u
wg_sep=1.0u
input_wg_sep=3.0u
output_wg_sep=3.0u
dw=0.1u
model=coupler_adiabatic
spiceprefix=P}
C {devices/iopin.sym} -250 -500 0 1 {name=p1 lab=pin1}
C {devices/iopin.sym} -250 -450 0 1 {name=p2 lab=pin2}
C {../../symbols/coupler.sym} 870 160 3 0 {name=coupler4
length=20.0u
gap=0.236u
dx=10u
dy=4.0u
model=coupler
spiceprefix=P}
C {../../symbols/cdc.sym} 1250 -470 1 0 {name=cdc1
length=30.0u
gap=0.5u
period=0.22
dc=0.5
dx=10u
dy=1.8u
width_top=2.0u
width_bot=0.75u
model=cdc
spiceprefix=P}
C {devices/iopin.sym} 1670 -460 1 1 {name=p4 lab=pin3}
C {devices/iopin.sym} 1730 -460 1 1 {name=p5 lab=pin4}

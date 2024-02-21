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
N 30 -610 50 -610 {
lab=pin2}
N 30 -630 50 -630 {
lab=pin1}
N 410 -610 430 -610 {
lab=#net1}
N 430 -610 430 -350 {
lab=#net1}
N 430 -350 550 -350 {
lab=#net1}
N 410 -630 470 -630 {
lab=#net2}
N 470 -630 470 -370 {
lab=#net2}
N 470 -370 550 -370 {
lab=#net2}
N 910 -350 1200 -350 {
lab=#net3}
N 910 -370 1200 -370 {
lab=#net4}
N 2030 -640 2100 -640 {
lab=pin3}
N 2030 -620 2110 -620 {
lab=pin4}
N 1560 -350 1620 -350 {
lab=#net5}
N 1620 -620 1620 -350 {
lab=#net5}
N 1620 -620 1670 -620 {
lab=#net5}
N 1570 -640 1670 -640 {
lab=#net6}
N 1570 -640 1570 -370 {
lab=#net6}
N 1560 -370 1570 -370 {
lab=#net6}
C {devices/title.sym} 160 -30 0 0 {name=l5 author="Mabrains Authors"}
C {../../symbols/mzi2x2_2x2_phase_shifter.sym} 140 -630 0 0 {name=mzi1
delta_length=10.0u
length_x=0.1u
length_y=2.0u
model=mzi2x2_2x2_phase_shifter
spiceprefix=P}
C {devices/iopin.sym} 30 -610 2 0 {name=p1 lab=pin2}
C {devices/iopin.sym} 30 -630 2 0 {name=p4 lab=pin1}
C {../../symbols/mzi2x2_2x2_phase_shifter.sym} 640 -370 0 0 {name=mzi2
delta_length=10.0u
length_x=0.1u
length_y=2.0u
model=mzi2x2_2x2_phase_shifter
spiceprefix=P}
C {../../symbols/mzi2x2_2x2_phase_shifter.sym} 1290 -370 0 0 {name=mzi3
delta_length=10.0u
length_x=0.1u
length_y=2.0u
model=mzi2x2_2x2_phase_shifter
spiceprefix=P}
C {devices/iopin.sym} 2100 -640 0 0 {name=p3 lab=pin3}
C {devices/iopin.sym} 2110 -620 0 0 {name=p2 lab=pin4}
C {../../symbols/mzi2x2_2x2_phase_shifter.sym} 1760 -640 0 0 {name=mzi4
delta_length=10.0u
length_x=0.1u
length_y=2.0u
model=mzi2x2_2x2_phase_shifter
spiceprefix=P}

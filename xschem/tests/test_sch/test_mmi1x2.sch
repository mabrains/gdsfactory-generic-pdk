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
N 1060 -610 1060 -530 {
lab=pin1}
N 1000 -610 1060 -610 {
lab=pin1}
N 770 -370 770 -170 {
lab=#net1}
N 770 -170 1020 -170 {
lab=#net1}
N 1330 -380 1330 -170 {
lab=#net2}
N 1100 -170 1330 -170 {
lab=#net2}
N 330 -330 410 -330 {
lab=#net3}
N 370 -860 370 -830 {
lab=pin2}
N 1690 -490 1690 -420 {
lab=#net4}
N 1770 -490 1770 -340 {
lab=#net5}
N 1690 -340 1770 -340 {
lab=#net5}
N 410 -470 410 -410 {
lab=#net6}
N 330 -470 330 -330 {
lab=#net3}
N 1730 -890 1730 -850 {
lab=pin3}
C {devices/title.sym} 160 -30 0 0 {name=l5 author="Mabrains Authors"}
C {../../symbols/mmi1x2.sym} 890 30 0 0 {name=mmi4
width_mmi=2.5u
length_mmi=5.5u
gap_mmi=0.25u
width=0.5u
width_taper=1u
length_taper=10u
model=mmi1x2
spiceprefix=P}
C {devices/iopin.sym} 1010 -610 2 0 {name=p1 lab=pin1}
C {devices/iopin.sym} 1730 -880 3 0 {name=p3 lab=pin3}
C {../../symbols/mmi1x2.sym} 1890 -210 3 0 {name=mmi1
width_mmi=2.5u
length_mmi=5.5u
gap_mmi=0.25u
width=0.5u
width_taper=1u
length_taper=10u
model=mmi1x2
spiceprefix=P}
C {../../symbols/mmi1x2.sym} 210 -540 1 0 {name=mmi2
width_mmi=2.5u
length_mmi=5.5u
gap_mmi=0.25u
width=0.5u
width_taper=1u
length_taper=10u
model=mmi1x2
spiceprefix=P}
C {../../symbols/mmi1x2.sym} 200 -270 0 0 {name=mmi5
width_mmi=2.5u
length_mmi=5.5u
gap_mmi=0.25u
width=0.5u
width_taper=1u
length_taper=10u
model=mmi1x2
spiceprefix=P}
C {devices/iopin.sym} 370 -850 3 0 {name=p4 lab=pin2}
C {../../symbols/mmi1x2.sym} 1560 -290 0 0 {name=mmi3
width_mmi=2.5u
length_mmi=5.5u
gap_mmi=0.25u
width=0.5u
width_taper=1u
length_taper=10u
model=mmi1x2
spiceprefix=P}

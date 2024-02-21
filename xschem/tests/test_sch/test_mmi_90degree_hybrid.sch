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
N -300 -500 -160 -500 {
lab=pin1}
N -300 -440 -160 -440 {
lab=pin2}
N 160 -380 390 -380 {
lab=#net1}
N 390 -380 390 -320 {
lab=#net1}
N 430 -420 430 -320 {
lab=#net2}
N 160 -420 430 -420 {
lab=#net2}
N 160 -460 460 -460 {
lab=#net3}
N 460 -460 470 -460 {
lab=#net3}
N 470 -460 470 -320 {
lab=#net3}
N 510 -500 510 -320 {
lab=#net4}
N 160 -500 510 -500 {
lab=#net4}
N 450 70 860 70 {
lab=#net5}
N 450 -0 450 70 {
lab=#net5}
N 390 0 390 130 {
lab=#net6}
N 390 130 860 130 {
lab=#net6}
N 1180 70 1620 70 {}
N 1620 70 1630 70 {}
N 1630 -10 1630 70 {}
N 1670 -10 1670 110 {}
N 1180 110 1670 110 {}
N 1180 150 1710 150 {}
N 1710 -10 1710 150 {}
N 1750 -10 1750 190 {}
N 1180 190 1750 190 {}
N 1690 -510 1690 -330 {}
N 1750 -510 1750 -330 {}
C {devices/title.sym} -440 350 0 0 {name=l5 author="Mabrains Authors"}
C {devices/iopin.sym} 1690 -505 1 1 {name=p3 lab=pin3}
C {devices/iopin.sym} 1750 -505 1 1 {name=p4 lab=pin4}
C {../../symbols/mmi_90degree_hybrid.sym} -70 -440 0 0 {name=mmi1
width_mmi=2.5u
length_mmi=5.5u
gap_mmi=0.25u
width=0.5u
width_taper=1u
length_taper=10u
model=mmi_90degree_hybrid
spiceprefix=P}
C {../../symbols/mmi_90degree_hybrid.sym} 450 -90 3 0 {name=mmi2
width_mmi=2.5u
length_mmi=5.5u
gap_mmi=0.25u
width=0.5u
width_taper=1u
length_taper=10u
model=mmi_90degree_hybrid
spiceprefix=P}
C {devices/iopin.sym} -300 -500 2 0 {name=p1 lab=pin1}
C {devices/iopin.sym} -300 -440 2 0 {name=p2 lab=pin2}
C {../../symbols/mmi_90degree_hybrid.sym} 950 130 0 0 {name=mmi3
width_mmi=2.5u
length_mmi=5.5u
gap_mmi=0.25u
width=0.5u
width_taper=1u
length_taper=10u
model=mmi_90degree_hybrid
spiceprefix=P}
C {../../symbols/mmi_90degree_hybrid.sym} 1690 -240 1 0 {name=mmi4
width_mmi=2.5u
length_mmi=5.5u
gap_mmi=0.25u
width=0.5u
width_taper=1u
length_taper=10u
model=mmi_90degree_hybrid
spiceprefix=P}

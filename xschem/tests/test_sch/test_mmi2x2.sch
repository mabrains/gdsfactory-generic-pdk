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
N 220 -550 510 -550 {
lab=#net1}
N 510 -550 510 -340 {
lab=#net1}
N 220 -420 380 -420 {
lab=#net2}
N 380 -420 380 -340 {
lab=#net2}
N 510 70 860 70 {
lab=#net3}
N 380 200 860 200 {
lab=#net4}
N 380 70 380 200 {
lab=#net4}
N 1270 200 1520 200 {
lab=#net5}
N 1270 70 1620 70 {
lab=#net6}
N 1520 200 1750 200 {
lab=#net5}
N 1750 70 1750 200 {
lab=#net5}
N 1620 -510 1620 -340 {
lab=pin3}
N 1750 -510 1750 -340 {
lab=pin4}
N -330 -550 -190 -550 {
lab=pin1}
N -330 -420 -190 -420 {
lab=pin2}
C {devices/title.sym} -440 350 0 0 {name=l5 author="Mabrains Authors"}
C {../../symbols/mmi2x2.sym} 30 -10 0 0 {name=mmi2
width_mmi=2.5u
length_mmi=5.5u
gap_mmi=0.25u
width=0.5u
width_taper=1u
length_taper=10u
model=mmi2x2
spiceprefix=P}
C {../../symbols/mmi2x2.sym} -30 -120 1 0 {name=mmi1
width_mmi=2.5u
length_mmi=5.5u
gap_mmi=0.25u
width=0.5u
width_taper=1u
length_taper=10u
model=mmi2x2
spiceprefix=P}
C {../../symbols/mmi2x2.sym} 1080 610 0 0 {name=mmi3
width_mmi=2.5u
length_mmi=5.5u
gap_mmi=0.25u
width=0.5u
width_taper=1u
length_taper=10u
model=mmi2x2
spiceprefix=P}
C {../../symbols/mmi2x2.sym} 2160 -150 3 0 {name=mmi4
width_mmi=2.5u
length_mmi=5.5u
gap_mmi=0.25u
width=0.5u
width_taper=1u
length_taper=10u
model=mmi2x2
spiceprefix=P}
C {devices/iopin.sym} -330 -550 0 1 {name=p1 lab=pin1}
C {devices/iopin.sym} -330 -420 0 1 {name=p2 lab=pin2}
C {devices/iopin.sym} 1620 -510 1 1 {name=p3 lab=pin3}
C {devices/iopin.sym} 1750 -510 1 1 {name=p4 lab=pin4}

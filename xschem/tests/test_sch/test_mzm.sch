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
N 0 -640 20 -640 {
lab=pin1}
N 380 -640 380 -370 {
lab=#net1}
N 380 -370 400 -370 {
lab=#net1}
N 760 -370 1260 -370 {
lab=#net2}
N 1620 -370 1650 -370 {
lab=#net3}
N 1650 -640 1650 -370 {
lab=#net3}
N 1650 -640 1670 -640 {
lab=#net3}
N 2030 -640 2080 -640 {
lab=pin3}
C {devices/title.sym} 160 -30 0 0 {name=l5 author="Mabrains Authors"}
C {../../symbols/mzm.sym} 490 -380 0 0 {name=mzm2
length_x=500u
length_y=2.0u
delta_length=0.0u
model=mzm
spiceprefix=P}
C {../../symbols/mzm.sym} 110 -650 0 0 {name=mzm1
length_x=500u
length_y=2.0u
delta_length=0.0u
model=mzm
spiceprefix=P}
C {devices/iopin.sym} 0 -640 2 0 {name=p2 lab=pin1}
C {../../symbols/mzm.sym} 1350 -380 0 0 {name=mzm3
length_x=500u
length_y=2.0u
delta_length=0.0u
model=mzm
spiceprefix=P}
C {../../symbols/mzm.sym} 1760 -650 0 0 {name=mzm4
length_x=500u
length_y=2.0u
delta_length=0.0u
model=mzm
spiceprefix=P}
C {devices/iopin.sym} 2080 -640 0 0 {name=p3 lab=pin2}

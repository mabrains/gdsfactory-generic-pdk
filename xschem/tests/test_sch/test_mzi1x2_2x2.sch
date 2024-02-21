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
N -10 -640 10 -640 {
lab=pin2}
N 310 -630 310 -360 {
lab=#net1}
N 310 -360 400 -360 {
lab=#net1}
N 340 -380 400 -380 {
lab=#net2}
N 340 -650 340 -380 {
lab=#net2}
N 310 -650 340 -650 {
lab=#net2}
N 700 -370 990 -370 {
lab=#net3}
N 990 -460 990 -370 {
lab=#net3}
N 1010 -460 1010 -370 {
lab=#net4}
N 1010 -370 1330 -370 {
lab=#net4}
N 1000 -840 1000 -760 {
lab=pin1}
N 950 -840 1000 -840 {
lab=pin1}
N 1630 -650 1630 -380 {
lab=#net5}
N 1630 -650 1670 -650 {
lab=#net5}
N 1650 -630 1670 -630 {
lab=#net6}
N 1650 -630 1650 -360 {
lab=#net6}
N 1630 -360 1650 -360 {
lab=#net6}
N 1970 -640 2020 -640 {
lab=xxx}
C {devices/title.sym} 160 -30 0 0 {name=l5 author="Mabrains Authors"}
C {../../symbols/mzi1x2_2x2.sym} 100 -650 0 0 {name=mzi1
delta_length=10.0u
length_x=0.1u
length_y=2.0u
model=mzi1x2_2x2
spiceprefix=P}
C {devices/iopin.sym} -10 -640 2 0 {name=p2 lab=pin2}
C {../../symbols/mzi1x2_2x2.sym} 610 -380 0 1 {name=mzi2
delta_length=10.0u
length_x=0.1u
length_y=2.0u
model=mzi1x2_2x2
spiceprefix=P}
C {../../symbols/mzi1x2_2x2.sym} 990 -670 3 1 {name=mzi3
delta_length=10.0u
length_x=0.1u
length_y=2.0u
model=mzi1x2_2x2
spiceprefix=P}
C {../../symbols/mzi1x2_2x2.sym} 1420 -380 0 0 {name=mzi4
delta_length=10.0u
length_x=0.1u
length_y=2.0u
model=mzi1x2_2x2
spiceprefix=P}
C {devices/iopin.sym} 960 -840 2 0 {name=p1 lab=pin1}
C {../../symbols/mzi1x2_2x2.sym} 1880 -650 0 1 {name=mzi5
delta_length=10.0u
length_x=0.1u
length_y=2.0u
model=mzi1x2_2x2
spiceprefix=P}
C {devices/iopin.sym} 2020 -640 0 0 {name=p3 lab=pin3}

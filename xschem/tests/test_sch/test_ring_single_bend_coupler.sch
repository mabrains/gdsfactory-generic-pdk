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
N -520 -360 -400 -360 {
lab=pin1}
N 190 -360 330 -360 {
lab=#net1}
N 330 230 330 300 {
lab=#net2}
N 330 300 790 300 {
lab=#net2}
N 1380 300 1840 300 {
lab=#net3}
N 1840 230 1840 300 {
lab=#net3}
N 1840 -360 1910 -360 {
lab=#net4}
N 2500 -360 2640 -360 {
lab=#net5}
C {devices/title.sym} -435 455 0 0 {name=l5 author="Mabrains Authors"}
C {../../symbols/ring_single_bend_coupler.sym} -220 160 0 0 {name=ring1
gap=0.2u
radius=5.0u
angle_inner=90
angle_outer=90
length_x=0.6u
length_y=0.6u
model=ring_single_bend_coupler
spiceprefix=P}
C {devices/iopin.sym} -520 -360 0 1 {name=p1 lab=pin1}
C {../../symbols/ring_single_bend_coupler.sym} 850 50 3 0 {name=ring2
gap=0.2u
radius=5.0u
angle_inner=90
angle_outer=90
length_x=0.6u
length_y=0.6u
model=ring_single_bend_coupler
spiceprefix=P}
C {../../symbols/ring_single_bend_coupler.sym} 1200 -220 2 0 {name=ring3
gap=0.2u
radius=5.0u
angle_inner=90
angle_outer=90
length_x=0.6u
length_y=0.6u
model=ring_single_bend_coupler
spiceprefix=P}
C {../../symbols/ring_single_bend_coupler.sym} 2360 50 3 0 {name=ring4
gap=0.2u
radius=5.0u
angle_inner=90
angle_outer=90
length_x=0.6u
length_y=0.6u
model=ring_single_bend_coupler
spiceprefix=P}
C {../../symbols/ring_single_bend_coupler.sym} 2320 -880 2 0 {name=ring5
gap=0.2u
radius=5.0u
angle_inner=90
angle_outer=90
length_x=0.6u
length_y=0.6u
model=ring_single_bend_coupler
spiceprefix=P}
C {devices/iopin.sym} 2640 -360 0 0 {name=p4 lab=pin2}

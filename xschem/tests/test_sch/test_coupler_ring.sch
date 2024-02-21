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
N -250 -440 -120 -440 {
lab=pin2}
N -80 -710 -80 -580 {
lab=pin1}
N 380 -430 380 -300 {
lab=#net1}
N 380 -440 380 -430 {
lab=#net1}
N 170 -440 380 -440 {
lab=#net1}
N 520 -580 520 -260 {
lab=#net2}
N 130 -580 520 -580 {
lab=#net2}
N 380 170 910 170 {
lab=#net3}
N 380 -10 380 170 {
lab=#net3}
N 950 -50 950 30 {
lab=#net4}
N 520 -50 950 -50 {
lab=#net4}
N 1160 -50 1160 30 {
lab=#net5}
N 1160 -60 1160 -50 {
lab=#net5}
N 1160 -60 1590 -60 {
lab=#net5}
N 1200 170 1730 170 {
lab=#net6}
N 1730 -20 1730 170 {
lab=#net6}
N 1590 -380 1590 -270 {
lab=pin3}
N 1730 -410 1730 -310 {
lab=#net7}
C {devices/title.sym} -440 350 0 0 {name=l5 author="Mabrains Authors"}
C {../../symbols/coupler_ring.sym} -280 -30 0 0 {name=coupler_ring1
gap=0.2u
radius=5.0u
length_x=4.0u
length_extension=3.0u
model=coupler_ring
spiceprefix=P}
C {../../symbols/coupler_ring.sym} 750 580 0 0 {name=coupler_ring3
gap=0.2u
radius=5.0u
length_x=4.0u
length_extension=3.0u
model=coupler_ring
spiceprefix=P}
C {../../symbols/coupler_ring.sym} 2140 140 3 0 {name=coupler_ring4
gap=0.2u
radius=5.0u
length_x=4.0u
length_extension=3.0u
model=coupler_ring
spiceprefix=P}
C {devices/iopin.sym} -250 -440 0 1 {name=p2 lab=pin2}
C {devices/iopin.sym} -80 -710 1 1 {name=p1 lab=pin1}
C {../../symbols/coupler_ring.sym} -30 -460 1 0 {name=coupler_ring2
gap=0.2u
radius=5.0u
length_x=4.0u
length_extension=3.0u
model=coupler_ring
spiceprefix=P}
C {devices/iopin.sym} 1590 -380 1 1 {name=p3 lab=pin3}
C {devices/iopin.sym} 1730 -410 1 1 {name=p4 lab=pin4}

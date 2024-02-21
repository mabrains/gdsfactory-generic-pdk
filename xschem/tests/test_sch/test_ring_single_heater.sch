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
N -340 -350 -200 -350 {
lab=pin1}
N 180 -350 330 -350 {
lab=#net1}
N 330 30 330 300 {
lab=#net2}
N 330 310 840 310 {
lab=#net2}
N 330 300 330 310 {
lab=#net2}
N 1220 310 1470 310 {
lab=#net3}
N 1470 30 1470 310 {
lab=#net3}
N 1470 -350 2080 -350 {
lab=#net4}
N 2460 -350 2620 -350 {
lab=pin4}
C {devices/title.sym} -435 455 0 0 {name=l5 author="Mabrains Authors"}
C {../../symbols/ring_single_heater.sym} -120 -120 0 0 {name=ring1
gap=0.2u
radius=10.0u
length_x=4.0u
length_y=0.6u
model=ring_single_heater
spiceprefix=P}
C {../../symbols/ring_single_heater.sym} 920 540 0 0 {name=ring3
gap=0.2u
radius=10.0u
length_x=4.0u
length_y=0.6u
model=ring_single_heater
spiceprefix=P}
C {../../symbols/ring_single_heater.sym} 2160 -120 0 0 {name=ring5
gap=0.2u
radius=10.0u
length_x=4.0u
length_y=0.6u
model=ring_single_heater
spiceprefix=P}
C {devices/iopin.sym} -340 -350 0 1 {name=p1 lab=pin1}
C {../../symbols/ring_single_heater.sym} 100 -270 1 0 {name=ring2
gap=0.2u
radius=10.0u
length_x=4.0u
length_y=0.6u
model=ring_single_heater
spiceprefix=P}
C {../../symbols/ring_single_heater.sym} 1240 -270 1 0 {name=ring4
gap=0.2u
radius=10.0u
length_x=4.0u
length_y=0.6u
model=ring_single_heater
spiceprefix=P}
C {devices/iopin.sym} 2620 -350 0 0 {name=p4 lab=pin2}

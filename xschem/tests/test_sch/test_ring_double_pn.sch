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
N -340 -640 -200 -640 {
lab=pin1}
N -340 -350 -200 -350 {
lab=pin2}
N 180 -350 330 -350 {
lab=#net1}
N 180 -640 620 -640 {
lab=#net2}
N 620 -640 620 -350 {
lab=#net2}
N 330 30 330 310 {
lab=#net3}
N 330 310 840 310 {
lab=#net3}
N 620 30 840 30 {
lab=#net4}
N 840 20 840 30 {
lab=#net4}
N 1220 20 1480 20 {
lab=#net5}
N 1770 20 1770 310 {
lab=#net6}
N 1220 310 1770 310 {
lab=#net6}
N 1770 -360 2080 -360 {
lab=#net7}
N 2080 -360 2080 -350 {
lab=#net7}
N 1480 -640 1480 -360 {
lab=#net8}
N 1480 -640 2080 -640 {
lab=#net8}
N 2460 -640 2610 -640 {
lab=pin3}
N 2460 -350 2610 -350 {
lab=pin3}
C {devices/title.sym} -435 455 0 0 {name=l5 author="Mabrains Authors"}
C {../../symbols/ring_double_pn.sym} -120 -120 0 0 {name=ring1
add_gap=0.3u
drop_gap=0.3u
radius=5.0u
doping_angle=85
length_x=0.1u
length_y=0.1u
model=ring_double_pn
spiceprefix=P}
C {../../symbols/ring_double_pn.sym} 920 540 0 0 {name=ring3
add_gap=0.3u
drop_gap=0.3u
radius=5.0u
doping_angle=85
length_x=0.1u
length_y=0.1u
model=ring_double_pn
spiceprefix=P}
C {../../symbols/ring_double_pn.sym} 2160 -120 0 0 {name=ring5
add_gap=0.3u
drop_gap=0.3u
radius=5.0u
doping_angle=85
length_x=0.1u
length_y=0.1u
model=ring_double_pn
spiceprefix=P}
C {devices/iopin.sym} -340 -640 0 1 {name=p1 lab=pin1}
C {devices/iopin.sym} -340 -350 0 1 {name=p2 lab=pin2}
C {../../symbols/ring_double_pn.sym} 100 -270 1 0 {name=ring2
add_gap=0.3u
drop_gap=0.3u
radius=5.0u
doping_angle=85
length_x=0.1u
length_y=0.1u
model=ring_double_pn
spiceprefix=P}
C {../../symbols/ring_double_pn.sym} 1250 -280 1 0 {name=ring4
add_gap=0.3u
drop_gap=0.3u
radius=5.0u
doping_angle=85
length_x=0.1u
length_y=0.1u
model=ring_double_pn
spiceprefix=P}
C {devices/iopin.sym} 2610 -640 0 0 {name=p3 lab=pin3}
C {devices/iopin.sym} 2610 -350 0 0 {name=p4 lab=pin4}

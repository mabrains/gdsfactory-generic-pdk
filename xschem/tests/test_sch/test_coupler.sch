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
N -260 -510 -120 -510 {
lab=pin1}
N -260 -450 -120 -450 {
lab=pin2}
N 170 -450 390 -450 {
lab=#net1}
N 390 -450 400 -450 {
lab=#net1}
N 170 -510 460 -510 {
lab=#net2}
N 400 -450 400 -300 {
lab=#net1}
N 460 -510 460 -300 {
lab=#net2}
N 460 -10 460 100 {
lab=#net3}
N 460 100 910 100 {
lab=#net3}
N 400 160 910 160 {
lab=#net4}
N 400 -10 400 160 {
lab=#net4}
N 1200 100 1660 100 {
lab=#net5}
N 1660 -20 1660 100 {
lab=#net5}
N 1720 -20 1720 150 {
lab=#net6}
N 1720 150 1720 160 {
lab=#net6}
N 1200 160 1720 160 {
lab=#net6}
N 1660 -480 1660 -310 {
lab=pin3}
N 1720 -480 1720 -310 {
lab=pin4}
N 400 -20 400 -10 {
lab=#net4}
N 460 -20 460 -10 {
lab=#net3}
C {devices/title.sym} -440 350 0 0 {name=l5 author="Mabrains Authors"}
C {../../symbols/coupler.sym} -280 -30 0 0 {name=coupler1
length=20.0u
gap=0.236u
dx=10u
dy=4.0u
model=coupler
spiceprefix=P}
C {../../symbols/coupler.sym} 750 580 0 0 {name=coupler3
length=20.0u
gap=0.236u
dx=10u
dy=4.0u
model=coupler
spiceprefix=P}
C {../../symbols/coupler.sym} 2140 140 3 0 {name=coupler4
length=20.0u
gap=0.236u
dx=10u
dy=4.0u
model=coupler
spiceprefix=P}
C {devices/iopin.sym} -260 -510 0 1 {name=p1 lab=pin1}
C {devices/iopin.sym} -260 -450 0 1 {name=p2 lab=pin2}
C {devices/iopin.sym} 1660 -470 1 1 {name=p4 lab=pin3}
C {devices/iopin.sym} 1720 -470 1 1 {name=p5 lab=pin4}
C {../../symbols/cdc.sym} -20 -470 1 0 {name=cdc1
length=30.0u
gap=0.5u
period=0.22
dc=0.5
dx=10u
dy=1.8u
width_top=2.0u
width_bot=0.75u
model=cdc
spiceprefix=P}

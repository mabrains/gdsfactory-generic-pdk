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
N -250 -510 -120 -510 {
lab=pin1}
N -250 -470 -120 -470 {
lab=pin2}
N 220 -470 420 -470 {
lab=#net1}
N 420 -470 420 -300 {
lab=#net1}
N 460 -510 460 -300 {
lab=#net2}
N 220 -510 460 -510 {
lab=#net2}
N 460 40 460 100 {
lab=#net3}
N 460 100 910 100 {
lab=#net3}
N 420 40 420 140 {
lab=#net4}
N 420 140 910 140 {
lab=#net4}
N 1250 100 1660 100 {
lab=#net5}
N 1660 -20 1660 100 {
lab=#net5}
N 1250 140 1700 140 {
lab=#net6}
N 1700 -20 1700 140 {
lab=#net6}
N 1660 -530 1660 -360 {
lab=pin3}
N 1700 -530 1700 -360 {
lab=#net7}
C {devices/title.sym} -440 350 0 0 {name=l5 author="Mabrains Authors"}
C {../../symbols/coupler_bent.sym} -280 -30 0 0 {name=coupler_bent1
gap=0.2u
radius=26u
length=8.6u
width1=0.4u
width2=0.4u
length_straight=10u
model=coupler_bent
spiceprefix=P}
C {../../symbols/coupler_bent.sym} 750 580 0 0 {name=coupler_bent3
gap=0.2u
radius=26u
length=8.6u
width1=0.4u
width2=0.4u
length_straight=10u
model=coupler_bent
spiceprefix=P}
C {../../symbols/coupler_bent.sym} 2140 140 3 0 {name=coupler_bent4
gap=0.2u
radius=26u
length=8.6u
width1=0.4u
width2=0.4u
length_straight=10u
model=coupler_bent
spiceprefix=P}
C {devices/iopin.sym} -240 -510 0 1 {name=p1 lab=pin1}
C {devices/iopin.sym} -240 -470 0 1 {name=p2 lab=pin2}
C {../../symbols/coupler_bent.sym} -20 -460 1 0 {name=coupler_bent2
gap=0.2u
radius=26u
length=8.6u
width1=0.4u
width2=0.4u
length_straight=10u
model=coupler_bent
spiceprefix=P}
C {devices/iopin.sym} 1660 -520 1 1 {name=p3 lab=pin3}
C {devices/iopin.sym} 1700 -520 1 1 {name=p4 lab=pin4}

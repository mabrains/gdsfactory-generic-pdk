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
N -250 -510 -130 -510 {
lab=pin1}
N -260 -450 -190 -450 {
lab=pin2}
N 390 -450 390 -370 {
lab=#net1}
N 230 -450 390 -450 {
lab=#net1}
N 450 -510 450 -310 {
lab=#net2}
N 170 -510 450 -510 {
lab=#net2}
N 450 100 900 100 {
lab=#net3}
N 450 -10 450 100 {
lab=#net3}
N 390 50 390 150 {
lab=#net4}
N 390 160 840 160 {
lab=#net4}
N 390 150 390 160 {
lab=#net4}
N 1200 100 1660 100 {
lab=#net5}
N 1660 -10 1660 100 {
lab=#net5}
N 1720 50 1720 150 {
lab=#net6}
N 1260 160 1720 160 {
lab=#net6}
N 1720 150 1720 160 {
lab=#net6}
N 1720 -470 1720 -370 {
lab=xxx}
N 1660 -450 1660 -310 {
lab=pin3}
C {devices/title.sym} -440 350 0 0 {name=l5 author="Mabrains Authors"}
C {../../symbols/mode_converter.sym} -280 -30 0 0 {name=mode_converter1
gap=0.3u
length=10.0u
mm_width=1.2u
mc_mm_width=1.0u
sm_width=0.5u
model=mode_converter
spiceprefix=P}
C {../../symbols/mode_converter.sym} 750 580 0 0 {name=mode_converter3
gap=0.3u
length=10.0u
mm_width=1.2u
mc_mm_width=1.0u
sm_width=0.5u
model=mode_converter
spiceprefix=P}
C {../../symbols/mode_converter.sym} 2140 140 3 0 {name=mode_converter4
gap=0.3u
length=10.0u
mm_width=1.2u
mc_mm_width=1.0u
sm_width=0.5u
model=mode_converter
spiceprefix=P}
C {devices/iopin.sym} -246.25 -510 0 1 {name=p1 lab=pin1}
C {devices/iopin.sym} -256.25 -450 0 1 {name=p2 lab=pin2}
C {../../symbols/mode_converter.sym} -30 -460 1 0 {name=mode_converter2
gap=0.3u
length=10.0u
mm_width=1.2u
mc_mm_width=1.0u
sm_width=0.5u
model=mode_converter
spiceprefix=P}
C {devices/iopin.sym} 1660 -440 3 0 {name=p3 lab=pin3}
C {devices/iopin.sym} 1720 -470 3 0 {name=p4 lab=pin4}

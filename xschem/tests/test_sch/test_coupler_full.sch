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
N -260 -440 -120 -440 {
lab=pin2}
N 170 -440 390 -440 {
lab=#net1}
N 390 -440 400 -440 {
lab=#net1}
N 400 -440 400 -280 {
lab=#net1}
N 470 -510 470 -280 {
lab=#net2}
N 170 -510 470 -510 {
lab=#net2}
N 470 10 470 100 {
lab=#net3}
N 470 100 910 100 {
lab=#net3}
N 400 170 910 170 {
lab=#net4}
N 400 10 400 170 {
lab=#net4}
N 1200 100 1660 100 {
lab=#net5}
N 1660 -20 1660 100 {
lab=#net5}
N 1730 -20 1730 160 {
lab=#net6}
N 1200 170 1730 170 {
lab=#net6}
N 1730 160 1730 170 {
lab=#net6}
N 1660 -470 1660 -310 {
lab=pin3}
N 1730 -470 1730 -310 {
lab=#net7}
C {devices/title.sym} -440 350 0 0 {name=l5 author="Mabrains Authors"}
C {../../symbols/coupler_full.sym} -280 -30 0 0 {name=coupler_full1
coupling_length=40.0u
dx=10.0u
dy=4.8u
gap=0.5u
dw=0.1u
model=coupler_full
spiceprefix=P}
C {../../symbols/coupler_full.sym} 750 580 0 0 {name=coupler_full3
coupling_length=40.0u
dx=10.0u
dy=4.8u
gap=0.5u
dw=0.1u
model=coupler_full
spiceprefix=P}
C {../../symbols/coupler_full.sym} 2140 140 3 0 {name=coupler_full4
coupling_length=40.0u
dx=10.0u
dy=4.8u
gap=0.5u
dw=0.1u
model=coupler_full
spiceprefix=P}
C {devices/iopin.sym} -260 -440 0 1 {name=p1 lab=pin2}
C {devices/iopin.sym} -260 -510 0 1 {name=p2 lab=pin1}
C {../../symbols/coupler_full.sym} -10 -440 1 0 {name=coupler_full2
coupling_length=40.0u
dx=10.0u
dy=4.8u
gap=0.5u
dw=0.1u
model=coupler_full
spiceprefix=P}
C {devices/iopin.sym} 1660 -470 1 1 {name=p3 lab=pin3}
C {devices/iopin.sym} 1730 -470 1 1 {name=p4 lab=pin4}

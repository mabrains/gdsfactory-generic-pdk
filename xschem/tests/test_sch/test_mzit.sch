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
N -60 -100 -10 -100 {
lab=pin1}
N -60 -40 -10 -40 {
lab=pin2}
N -320 120 -10 120 {
lab=#net1}
N -320 180 -10 180 {
lab=#net2}
N -320 340 1160 340 {
lab=#net3}
N -320 400 1160 400 {
lab=#net4}
N 880 180 1160 180 {
lab=#net5}
N 880 120 1160 120 {
lab=#net6}
N 880 -100 940 -100 {
lab=pin3}
N 880 -40 940 -40 {
lab=pin4}
C {devices/title.sym} -550 560 0 0 {name=l5 author="Mabrains Authors"}
C {../../symbols/mzit.sym} 50 170 2 1 {name=mzi1
w0=0.5u
w1=0.45u
w2=0.55u
dy=2.0u
delta_length=10.0u
length=1.0u
coupler_length1=5.0u
coupler_length2=10.0u
coupler_gap1=0.2u
coupler_gap2=0.3u
taper_length=5.0u
model=mzit
spiceprefix=P}
C {../../symbols/mzit.sym} 820 -90 0 1 {name=mzi4
w0=0.5u
w1=0.45u
w2=0.55u
dy=2.0u
delta_length=10.0u
length=1.0u
coupler_length1=5.0u
coupler_length2=10.0u
coupler_gap1=0.2u
coupler_gap2=0.3u
taper_length=5.0u
model=mzit
spiceprefix=P}
C {devices/iopin.sym} -60 -100 2 0 {name=p5 lab=pin1}
C {devices/iopin.sym} -60 -40 2 0 {name=p1 lab=pin2}
C {../../symbols/mzit.sym} -380 390 2 0 {name=mzi2
w0=0.5u
w1=0.45u
w2=0.55u
dy=2.0u
delta_length=10.0u
length=1.0u
coupler_length1=5.0u
coupler_length2=10.0u
coupler_gap1=0.2u
coupler_gap2=0.3u
taper_length=5.0u
model=mzit
spiceprefix=P}
C {../../symbols/mzit.sym} 1220 130 0 0 {name=mzi3
w0=0.5u
w1=0.45u
w2=0.55u
dy=2.0u
delta_length=10.0u
length=1.0u
coupler_length1=5.0u
coupler_length2=10.0u
coupler_gap1=0.2u
coupler_gap2=0.3u
taper_length=5.0u
model=mzit
spiceprefix=P}
C {devices/iopin.sym} 930 -100 0 0 {name=p3 lab=pin3}
C {devices/iopin.sym} 930 -40 0 0 {name=p4 lab=pin4}

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
N -530 -360 -400 -360 {
lab=pin1}
N 190 -360 320 -360 {
lab=#net1}
N 320 230 320 320 {
lab=#net2}
N 320 320 790 320 {
lab=#net2}
N 1380 320 1840 320 {
lab=#net3}
N 1840 230 1840 320 {
lab=#net3}
N 1840 -360 1900 -360 {
lab=#net4}
N 2490 -360 2650 -360 {
lab=pin2}
C {devices/title.sym} -435 455 0 0 {name=l5 author="Mabrains Authors"}
C {../../symbols/disk.sym} -220 160 0 0 {name=disk1
radius=10.0u
gap=0.2u
wrap_angle_deg=180.0
parity=1
model=disk
spiceprefix=P}
C {devices/iopin.sym} -530 -360 0 1 {name=p1 lab=pin1}
C {../../symbols/disk.sym} 840 -180 3 1 {name=disk2
radius=10.0u
gap=0.2u
wrap_angle_deg=180.0
parity=1
model=disk
spiceprefix=P}
C {../../symbols/disk.sym} 970 -200 2 1 {name=disk3
radius=10.0u
gap=0.2u
wrap_angle_deg=180.0
parity=1
model=disk
spiceprefix=P}
C {../../symbols/disk.sym} 2360 -180 3 1 {name=disk4
radius=10.0u
gap=0.2u
wrap_angle_deg=180.0
parity=1
model=disk
spiceprefix=P}
C {../../symbols/disk.sym} 2080 -880 2 1 {name=disk5
radius=10.0u
gap=0.2u
wrap_angle_deg=180.0
parity=1
model=disk
spiceprefix=P}
C {devices/iopin.sym} 2650 -360 0 0 {name=p2 lab=pin2}

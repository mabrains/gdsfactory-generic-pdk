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
N 2500 -360 2630 -360 {
lab=#net5}
C {devices/title.sym} -435 455 0 0 {name=l5 author="Mabrains Authors"}
C {../../symbols/disk_heater.sym} -220 160 0 0 {name=disk1
radius=10.0u
radius=10.0u
gap=0.2u
wrap_angle_deg=180.0
parity=1
heater_width=5.0u
heater_extent=2.0u
model=disk_heater
spiceprefix=P}
C {devices/iopin.sym} -520 -360 0 1 {name=p1 lab=pin1}
C {../../symbols/disk_heater.sym} 850 50 3 0 {name=disk2
radius=10.0u
radius=10.0u
gap=0.2u
wrap_angle_deg=180.0
parity=1
heater_width=5.0u
heater_extent=2.0u
model=disk_heater
spiceprefix=P}
C {../../symbols/disk_heater.sym} 1200 -220 2 0 {name=disk3
radius=10.0u
radius=10.0u
gap=0.2u
wrap_angle_deg=180.0
parity=1
heater_width=5.0u
heater_extent=2.0u
model=disk_heater
spiceprefix=P}
C {../../symbols/disk_heater.sym} 2360 50 3 0 {name=disk4
radius=10.0u
radius=10.0u
gap=0.2u
wrap_angle_deg=180.0
parity=1
heater_width=5.0u
heater_extent=2.0u
model=disk_heater
spiceprefix=P}
C {../../symbols/disk_heater.sym} 2320 -880 2 0 {name=disk5
radius=10.0u
radius=10.0u
gap=0.2u
wrap_angle_deg=180.0
parity=1
heater_width=5.0u
heater_extent=2.0u
model=disk_heater
spiceprefix=P}
C {devices/iopin.sym} 2630 -360 0 0 {name=p2 lab=pin2}

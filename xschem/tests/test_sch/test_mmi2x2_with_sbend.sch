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
N 1610 -420 1610 -250 {
lab=pin3}
N 1770 -420 1770 -250 {
lab=pin4}
N -290 -500 -150 -500 {
lab=pin1}
N -290 -460 -150 -460 {
lab=pin2}
N 80 -400 410 -400 {
lab=#net5}
N 410 -400 420 -400 {
lab=#net5}
N 420 -400 420 -280 {
lab=#net5}
N 460 -560 460 -280 {
lab=#net6}
N 80 -560 460 -560 {
lab=#net6}
N 360 150 920 150 {}
N 360 -50 360 150 {}
N 520 110 920 110 {}
N 520 -50 520 110 {}
N 1150 50 1670 50 {}
N 1670 -20 1670 50 {}
N 1150 210 1710 210 {}
N 1710 -20 1710 210 {}
C {devices/title.sym} -440 350 0 0 {name=l5 author="Mabrains Authors"}
C {devices/iopin.sym} -290 -500 0 1 {name=p1 lab=pin1}
C {devices/iopin.sym} -290 -460 0 1 {name=p2 lab=pin2}
C {devices/iopin.sym} 1610 -420 1 1 {name=p3 lab=pin3}
C {devices/iopin.sym} 1770 -420 1 1 {name=p4 lab=pin4}
C {../../symbols/mmi2x2_with_sbend.sym} -110 -500 0 0 {name=mmi1
model=mmi2x2_with_sbend
spiceprefix=P}
C {../../symbols/mmi2x2_with_sbend.sym} 460 -240 1 0 {name=mmi2
model=mmi2x2_with_sbend
spiceprefix=P}
C {../../symbols/mmi2x2_with_sbend.sym} 960 110 0 0 {name=mmi3
model=mmi2x2_with_sbend
spiceprefix=P}
C {../../symbols/mmi2x2_with_sbend.sym} 1670 -60 3 0 {name=mmi4
model=mmi2x2_with_sbend
spiceprefix=P}

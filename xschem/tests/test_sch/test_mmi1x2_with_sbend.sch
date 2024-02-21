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
N 1060 -480 1060 -400 {
lab=pin1}
N 1000 -480 1060 -480 {
lab=pin1}
N 770 -370 770 -170 {
lab=#net1}
N 1330 -380 1330 -170 {
lab=#net2}
N 370 -860 370 -830 {
lab=pin2}
N 1730 -890 1730 -850 {
lab=pin3}
N 290 -600 290 -290 {}
N 290 -290 540 -290 {}
N 450 -450 540 -450 {}
N 450 -600 450 -450 {}
N 770 -170 980 -170 {}
N 1140 -170 1330 -170 {}
N 1560 -460 1650 -460 {}
N 1650 -620 1650 -460 {}
N 1810 -620 1810 -300 {}
N 1570 -300 1810 -300 {}
N 1560 -300 1570 -300 {}
C {devices/title.sym} 160 -30 0 0 {name=l5 author="Mabrains Authors"}
C {devices/iopin.sym} 1010 -480 2 0 {name=p1 lab=pin1}
C {devices/iopin.sym} 1730 -880 3 0 {name=p3 lab=pin3}
C {devices/iopin.sym} 370 -850 3 0 {name=p4 lab=pin2}
C {../../symbols/mmi1x2_with_sbend.sym} 370 -790 1 0 {name=mmi1
model=mmi1x2_with_sbend
spiceprefix=P}
C {../../symbols/mmi1x2_with_sbend.sym} 730 -370 2 0 {name=mmi2
model=mmi1x2_with_sbend
spiceprefix=P}
C {../../symbols/mmi1x2_with_sbend.sym} 1060 -360 1 0 {name=mmi3
model=mmi1x2_with_sbend
spiceprefix=P}
C {../../symbols/mmi1x2_with_sbend.sym} 1370 -380 0 0 {name=mmi4
model=mmi1x2_with_sbend
spiceprefix=P}
C {../../symbols/mmi1x2_with_sbend.sym} 1730 -810 1 0 {name=mmi5
model=mmi1x2_with_sbend
spiceprefix=P}

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
N 35 -652.5 65 -652.5 {
lab=pin2}
N 1018.75 -802.5 1018.75 -722.5 {
lab=pin1}
N 958.75 -802.5 1018.75 -802.5 {
lab=pin1}
N 1971.25 -656.25 2026.25 -656.25 {
lab=pin3}
N 378.75 -651.25 378.75 -390 {
lab=#net1}
N 378.75 -390 440 -390 {
lab=#net1}
N 700 -390 1367.5 -390 {
lab=#net2}
N 1018.75 -462.5 1018.75 -390 {
lab=#net2}
N 1627.5 -390 1682.5 -390 {
lab=#net3}
N 1682.5 -390 1683.75 -655 {
lab=#net3}
N 1683.75 -656.25 1711.25 -656.25 {
lab=#net3}
N 1683.75 -656.25 1683.75 -655 {
lab=#net3}
N 325 -652.5 378.75 -652.5 {
lab=#net1}
N 378.75 -652.5 378.75 -651.25 {
lab=#net1}
C {devices/title.sym} 160 -30 0 0 {name=l5 author="Mabrains Authors"}
C {devices/iopin.sym} 35 -652.5 2 0 {name=p4 lab=pin2}
C {../../symbols/dbr.sym} 115 -642.5 0 0 {name=dbr1
w1=0.475u
w2=0.525u
l1=0.159u
l2=0.159u
n=10
model=dbr
spiceprefix=P}
C {../../symbols/dbr.sym} 490 -380 0 0 {name=dbr2
w1=0.475u
w2=0.525u
l1=0.159u
l2=0.159u
n=10
model=dbr
spiceprefix=P}
C {devices/iopin.sym} 968.75 -802.5 2 0 {name=p1 lab=pin1}
C {../../symbols/dbr.sym} 1008.75 -672.5 1 0 {name=dbr3
w1=0.475u
w2=0.525u
l1=0.159u
l2=0.159u
n=10
model=dbr
spiceprefix=P}
C {../../symbols/dbr.sym} 1417.5 -380 0 0 {name=dbr4
w1=0.475u
w2=0.525u
l1=0.159u
l2=0.159u
n=10
model=dbr
spiceprefix=P}
C {../../symbols/dbr.sym} 1761.25 -646.25 0 0 {name=dbr5
w1=0.475u
w2=0.525u
l1=0.159u
l2=0.159u
n=10
model=dbr
spiceprefix=P}
C {devices/iopin.sym} 2026.25 -656.25 0 0 {name=p3 lab=pin3}

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
N 2193.75 -357.5 2363.75 -357.5 {
lab=pin2}
N -340 -355 -200 -355 {
lab=pin1}
N 190 -355 375 -355 {
lab=#net1}
N 375 -355 376.25 -190 {
lab=#net1}
N 377.5 345 803.75 345 {
lab=#net2}
N 376.25 200 377.5 345 {
lab=#net2}
N 1193.75 345 1620 345 {
lab=#net3}
N 1618.75 200 1620 345 {
lab=#net3}
N 1618.75 -357.5 1618.75 -190 {
lab=#net4}
N 1618.75 -357.5 1803.75 -357.5 {
lab=#net4}
C {devices/title.sym} -460 846.25 0 0 {name=l5 author="Mabrains Authors"}
C {devices/iopin.sym} -340 -355 0 1 {name=p2 lab=pin1}
C {devices/iopin.sym} 2363.75 -357.5 2 1 {name=p1 lab=pin2}
C {../../symbols/interdigital_capacitor.sym} -140 -335 0 0 {name=interdigital_capacitor1
fingers=4
finger_length=20.0u
finger_gap=2.0u
thickness=5.0u
model=interdigital_capacitor
spiceprefix=P}
C {../../symbols/interdigital_capacitor.sym} 356.25 -130 1 0 {name=interdigital_capacitor2
fingers=4
finger_length=20.0u
finger_gap=2.0u
thickness=5.0u
model=interdigital_capacitor
spiceprefix=P}
C {../../symbols/interdigital_capacitor.sym} 863.75 325 2 1 {name=interdigital_capacitor3
fingers=4
finger_length=20.0u
finger_gap=2.0u
thickness=5.0u
model=interdigital_capacitor
spiceprefix=P}
C {../../symbols/interdigital_capacitor.sym} 1638.75 140 3 0 {name=interdigital_capacitor4
fingers=4
finger_length=20.0u
finger_gap=2.0u
thickness=5.0u
model=interdigital_capacitor
spiceprefix=P}
C {../../symbols/interdigital_capacitor.sym} 1863.75 -337.5 0 0 {name=interdigital_capacitor5
fingers=4
finger_length=20.0u
finger_gap=2.0u
thickness=5.0u
model=interdigital_capacitor
spiceprefix=P}

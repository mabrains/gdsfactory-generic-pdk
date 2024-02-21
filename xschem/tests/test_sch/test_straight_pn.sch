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
N 2883.75 -352.5 3053.75 -352.5 {
lab=pin2}
N -340 -355 -200 -355 {
lab=pin1}
N 390 -355 545 -355 {
lab=#net1}
N 546.25 370 546.25 650 {
lab=#net2}
N 2138.75 371.25 2138.75 651.25 {
lab=#net3}
N 546.25 -353.75 546.25 -220 {
lab=#net1}
N 545 -355 546.25 -355 {
lab=#net1}
N 546.25 -355 546.25 -353.75 {
lab=#net1}
N 2138.75 -352.5 2138.75 -218.75 {
lab=#net4}
N 2138.75 -352.5 2293.75 -352.5 {
lab=#net4}
N 546.25 650 546.25 651.25 {
lab=#net2}
N -396.25 -88.75 -256.25 -88.75 {
lab=p_pin}
N -396.25 -20 -256.25 -20 {
lab=n_pin}
N 496.25 -206.25 496.25 -150 {
lab=n_pin}
N 1062.5 601.25 1118.75 601.25 {
lab=n_pin}
N 2307.5 -302.5 2363.75 -302.5 {
lab=n_pin}
N 320 -405 376.25 -405 {
lab=p_pin}
N 1568.75 701.25 1625 701.25 {
lab=p_pin}
N 2813.75 -402.5 2870 -402.5 {
lab=p_pin}
N 1638.75 651.25 2138.75 651.25 {
lab=#net3}
N 546.25 651.25 1048.75 651.25 {
lab=#net2}
N 596.25 300 596.25 350 {
lab=p_pin}
N 2188.75 301.25 2188.75 350 {
lab=n_pin}
N 2088.75 -198.75 2088.75 -148.75 {
lab=p_pin}
N -230 -305 -130 -305 {
lab=n_pin}
C {devices/title.sym} -460 846.25 0 0 {name=l5 author="Mabrains Authors"}
C {devices/iopin.sym} -340 -355 0 1 {name=p2 lab=pin1}
C {devices/iopin.sym} 3053.75 -352.5 2 1 {name=p1 lab=pin2}
C {../../symbols/straight_pn.sym} -300 25 0 0 {name=pn1
length=1000.0u
via_stack_width=10.0u
via_stack_spacing=2u
model=straight_pn
spiceprefix=P}
C {../../symbols/straight_pn.sym} 166.25 -320 1 0 {name=pn2
length=1000.0u
via_stack_width=10.0u
via_stack_spacing=2u
model=straight_pn
spiceprefix=P}
C {../../symbols/straight_pn.sym} 948.75 271.25 2 1 {name=pn3
length=1000.0u
via_stack_width=10.0u
via_stack_spacing=2u
model=straight_pn
spiceprefix=P}
C {../../symbols/straight_pn.sym} 2518.75 471.25 3 0 {name=pn4
length=1000.0u
via_stack_width=10.0u
via_stack_spacing=2u
model=straight_pn
spiceprefix=P}
C {../../symbols/straight_pn.sym} 2193.75 27.5 0 0 {name=pn5
length=1000.0u
via_stack_width=10.0u
via_stack_spacing=2u
model=straight_pn
spiceprefix=P}
C {devices/iopin.sym} -396.25 -88.75 0 1 {name=p_pin lab=p_pin}
C {devices/iopin.sym} -396.25 -20 0 1 {name=n_pin lab=n_pin}
C {devices/lab_pin.sym} 496.25 -206.25 1 0 {name=l2 sig_type=std_logic lab=n_pin}
C {devices/lab_pin.sym} 1062.5 601.25 0 0 {name=l3 sig_type=std_logic lab=n_pin}
C {devices/lab_pin.sym} 2188.75 350 0 1 {name=l4 sig_type=std_logic lab=n_pin}
C {devices/lab_pin.sym} 2307.5 -302.5 0 0 {name=l6 sig_type=std_logic lab=n_pin}
C {devices/lab_pin.sym} 376.25 -405 0 1 {name=l7 sig_type=std_logic lab=p_pin}
C {devices/lab_pin.sym} 596.25 350 0 1 {name=l8 sig_type=std_logic lab=p_pin}
C {devices/lab_pin.sym} 1625 701.25 0 1 {name=l9 sig_type=std_logic lab=p_pin}
C {devices/lab_pin.sym} 2088.75 -198.75 0 0 {name=l10 sig_type=std_logic lab=p_pin}
C {devices/lab_pin.sym} 2870 -402.5 0 1 {name=l11 sig_type=std_logic lab=p_pin}
C {devices/lab_pin.sym} -230 -305 0 0 {name=l1 sig_type=std_logic lab=n_pin}

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
N -396.25 -88.75 -256.25 -88.75 {
lab=hp_pin}
N -396.25 -20 -256.25 -20 {
lab=hn_pin}
N 360 -420 416.25 -420 {
lab=hp_pin}
N -230 -300 -190 -300 {
lab=hn_pin}
N -330 -360 -210 -360 {
lab=pin1}
N 490 -260 490 -200 {
lab=hn_pin}
N 380 -360 550 -360 {
lab=#net1}
N 550 -360 550 -220 {
lab=#net1}
N 610 350 650 350 {
lab=hp_pin}
N 990 590 1060 590 {
lab=hn_pin}
N 560 650 1040 650 {
lab=#net2}
N 550 370 550 650 {
lab=#net2}
N 550 650 560 650 {
lab=#net2}
N 1610 710 1670 710 {
lab=hp_pin}
N 1630 650 2130 650 {
lab=#net3}
N 2140 370 2140 650 {
lab=#net3}
N 2130 650 2140 650 {
lab=#net3}
N 2200 350 2270 350 {
lab=hn_pin}
N 2040 -200 2080 -200 {
lab=hp_pin}
N 2140 -350 2140 -220 {
lab=#net4}
N 2140 -350 2300 -350 {
lab=#net4}
N 2260 -290 2320 -290 {
lab=hp_pin}
N 2890 -350 3000 -350 {
lab=pin2}
N 2870 -410 2940 -410 {
lab=hp_pin}
C {devices/title.sym} -460 846.25 0 0 {name=l5 author="Mabrains Authors"}
C {devices/iopin.sym} -396.25 -88.75 0 1 {name=hp_pin lab=hp_pin}
C {devices/iopin.sym} -396.25 -20 0 1 {name=hn_pin lab=hn_pin}
C {devices/lab_pin.sym} 416.25 -420 0 1 {name=l7 sig_type=std_logic lab=hp_pin}
C {../../symbols/straight_heater_doped_strip.sym} -310 20 0 0 {name=heater1
length=320.0u
nsections=3
heater_width=2.0u
heater_gap=0.8u
via_stack_gap=0.0u
width=0.5u
xoffset_tip1=0.2u
xoffset_tip2=0.4u
model=straight_heater_doped_strip
spiceprefix=P}
C {devices/lab_pin.sym} -230 -300 0 0 {name=l1 sig_type=std_logic lab=hn_pin}
C {devices/iopin.sym} -330 -360 0 1 {name=p2 lab=pin1}
C {../../symbols/straight_heater_doped_strip.sym} 170 -320 1 0 {name=heater2
length=320.0u
nsections=3
heater_width=2.0u
heater_gap=0.8u
via_stack_gap=0.0u
width=0.5u
xoffset_tip1=0.2u
xoffset_tip2=0.4u
model=straight_heater_doped_strip
spiceprefix=P}
C {devices/lab_pin.sym} 490 -260 1 0 {name=l2 sig_type=std_logic lab=hn_pin}
C {devices/lab_pin.sym} 650 350 0 1 {name=l8 sig_type=std_logic lab=hp_pin}
C {../../symbols/straight_heater_doped_strip.sym} 940 270 2 1 {name=heater3
length=320.0u
nsections=3
heater_width=2.0u
heater_gap=0.8u
via_stack_gap=0.0u
width=0.5u
xoffset_tip1=0.2u
xoffset_tip2=0.4u
model=straight_heater_doped_strip
spiceprefix=P}
C {devices/lab_pin.sym} 990 590 0 0 {name=l3 sig_type=std_logic lab=hn_pin}
C {devices/lab_pin.sym} 1670 710 0 1 {name=l9 sig_type=std_logic lab=hp_pin}
C {../../symbols/straight_heater_doped_strip.sym} 2520 470 3 0 {name=heater4
length=320.0u
nsections=3
heater_width=2.0u
heater_gap=0.8u
via_stack_gap=0.0u
width=0.5u
xoffset_tip1=0.2u
xoffset_tip2=0.4u
model=straight_heater_doped_strip
spiceprefix=P}
C {devices/lab_pin.sym} 2270 350 0 1 {name=l4 sig_type=std_logic lab=hn_pin}
C {devices/lab_pin.sym} 2040 -200 0 0 {name=l10 sig_type=std_logic lab=hp_pin}
C {../../symbols/straight_heater_doped_strip.sym} 2200 30 0 0 {name=heater5
length=320.0u
nsections=3
heater_width=2.0u
heater_gap=0.8u
via_stack_gap=0.0u
width=0.5u
xoffset_tip1=0.2u
xoffset_tip2=0.4u
model=straight_heater_doped_strip
spiceprefix=P}
C {devices/lab_pin.sym} 2260 -290 0 0 {name=l6 sig_type=std_logic lab=hp_pin}
C {devices/iopin.sym} 3000 -350 0 0 {name=p4 lab=pin2}
C {devices/lab_pin.sym} 2940 -410 0 1 {name=l11 sig_type=std_logic lab=hn_pin}

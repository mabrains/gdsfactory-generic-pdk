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
* by the Free Software Foundation, either 3 of the License, or
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
N -256.25 -400 -200 -400 {
lab=hn_pin}
N 265 -370 321.25 -370 {
lab=hp_pin}
N 530 -230 530 -180 {
lab=hn_pin}
N 500 290 500 350 {
lab=hp_pin}
N 550 290 550 650 {
lab=#net1}
N 550 650 1090 650 {
lab=#net1}
N 1033.75 600 1090 600 {
lab=hn_pin}
N 1560 580 2150 580 {
lab=#net2}
N 2150 290 2150 580 {
lab=#net2}
N 2100 290 2100 360 {
lab=hn_pin}
N 2130 -250 2130 -180 {
lab=hp_pin}
N 2080 -340 2080 -180 {
lab=#net3}
N 2080 -350 2300 -350 {
lab=#net3}
N 2080 -350 2080 -340 {
lab=#net3}
N 2250 -400 2300 -400 {
lab=hn_pin}
N 2770 -370 2820 -370 {
lab=hn_pin}
N 2770 -420 2940 -420 {
lab=pin2}
N -300 -350 -200 -350 {
lab=pin1}
N 480 -420 480 -180 {
lab=#net4}
N 270 -420 480 -420 {
lab=#net4}
N 1560 630 1630 630 {
lab=hp_pin}
C {devices/title.sym} -460 846.25 0 0 {name=l5 author="Mabrains Authors"}
C {devices/iopin.sym} -396.25 -88.75 0 1 {name=hp_pin lab=hp_pin}
C {devices/iopin.sym} -396.25 -20 0 1 {name=hn_pin lab=hn_pin}
C {devices/lab_pin.sym} -256.25 -400 0 0 {name=l1 sig_type=std_logic lab=hn_pin}
C {devices/lab_pin.sym} 321.25 -370 0 1 {name=l7 sig_type=std_logic lab=hp_pin}
C {../../symbols/straight_heater_meander.sym} -330 40 0 0 {name=heater1
length=300.0u
spacing=2.0u
heater_width=2.5u
extension_length=15.0u
radius=90u
heater_taper_length=10.0u
taper_length=10.0u
model=straight_heater_meander
spiceprefix=P}
C {../../symbols/straight_heater_meander.sym} 90 -310 1 0 {name=heater2
length=300.0u
spacing=2.0u
heater_width=2.5u
extension_length=15.0u
radius=90u
heater_taper_length=10.0u
taper_length=10.0u
model=straight_heater_meander
spiceprefix=P}
C {devices/lab_pin.sym} 530 -230 1 0 {name=l2 sig_type=std_logic lab=hn_pin}
C {devices/lab_pin.sym} 500 350 0 0 {name=l8 sig_type=std_logic lab=hp_pin}
C {../../symbols/straight_heater_meander.sym} 960 1040 0 0 {name=heater3
length=300.0u
spacing=2.0u
heater_width=2.5u
extension_length=15.0u
radius=90u
heater_taper_length=10.0u
taper_length=10.0u
model=straight_heater_meander
spiceprefix=P}
C {devices/lab_pin.sym} 1033.75 600 0 0 {name=l3 sig_type=std_logic lab=hn_pin}
C {../../symbols/straight_heater_meander.sym} 1690 -310 1 0 {name=heater4
length=300.0u
spacing=2.0u
heater_width=2.5u
extension_length=15.0u
radius=90u
heater_taper_length=10.0u
taper_length=10.0u
model=straight_heater_meander
spiceprefix=P}
C {devices/lab_pin.sym} 2100 360 0 0 {name=l4 sig_type=std_logic lab=hn_pin}
C {devices/lab_pin.sym} 2130 -250 0 1 {name=l10 sig_type=std_logic lab=hp_pin}
C {../../symbols/straight_heater_meander.sym} 2170 40 0 0 {name=heater5
length=300.0u
spacing=2.0u
heater_width=2.5u
extension_length=15.0u
radius=90u
heater_taper_length=10.0u
taper_length=10.0u
model=straight_heater_meander
spiceprefix=P}
C {devices/lab_pin.sym} 2250 -400 0 0 {name=l6 sig_type=std_logic lab=hn_pin}
C {devices/lab_pin.sym} 2820 -370 0 1 {name=l11 sig_type=std_logic lab=hn_pin}
C {devices/iopin.sym} -300 -350 0 1 {name=p2 lab=pin1}
C {devices/iopin.sym} 2940 -420 0 0 {name=p1 lab=pin2}
C {devices/lab_pin.sym} 1630 630 0 1 {name=l9 sig_type=std_logic lab=hp_pin}

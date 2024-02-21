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
N -256.25 -410 -200 -410 {
lab=hn_pin}
N -300 -390 -200 -390 {
lab=pin1}
N 270 -360 330 -360 {
lab=hp_pin}
N 270 -390 520 -390 {
lab=#net1}
N 550 -240 550 -180 {
lab=hn_pin}
N 530 -390 530 -180 {
lab=#net1}
N 520 -390 530 -390 {
lab=#net1}
N 500 290 500 350 {
lab=hp_pin}
N 530 290 530 630 {
lab=#net2}
N 530 630 1080 630 {
lab=#net2}
N 1030 610 1080 610 {
lab=hn_pin}
N 1550 660 1610 660 {
lab=hp_pin}
N 1550 630 2110 630 {
lab=#net3}
N 2110 290 2110 630 {
lab=#net3}
N 2080 290 2080 340 {
lab=hn_pin}
N 2110 -370 2110 -180 {
lab=#net4}
N 2110 -380 2310 -380 {
lab=#net4}
N 2110 -380 2110 -370 {
lab=#net4}
N 2130 -230 2130 -180 {
lab=hp_pin}
N 2250 -400 2310 -400 {
lab=hn_pin}
N 2780 -350 2830 -350 {
lab=hp_pin}
N 2780 -380 2890 -380 {
lab=#net5}
C {devices/title.sym} -460 846.25 0 0 {name=l5 author="Mabrains Authors"}
C {devices/iopin.sym} -396.25 -88.75 0 1 {name=hp_pin lab=hp_pin}
C {devices/iopin.sym} -396.25 -20 0 1 {name=hn_pin lab=hn_pin}
C {devices/lab_pin.sym} -256.25 -410 0 0 {name=l1 sig_type=std_logic lab=hn_pin}
C {../../symbols/straight_heater_metal_simple.sym} -330 40 0 0 {name=heater1
length=320.0u
length_undercut_spacing=6.0u
length_undercut=30.0u
heater_taper_length=5.0u
model=straight_heater_metal_simple
spiceprefix=P}
C {devices/iopin.sym} -300 -390 0 1 {name=p2 lab=pin1}
C {devices/lab_pin.sym} 330 -360 0 1 {name=l7 sig_type=std_logic lab=hp_pin}
C {../../symbols/straight_heater_metal_simple.sym} 100 -310 1 0 {name=heater2
length=320.0u
length_undercut_spacing=6.0u
length_undercut=30.0u
heater_taper_length=5.0u
model=straight_heater_metal_simple
spiceprefix=P}
C {devices/lab_pin.sym} 550 -240 0 1 {name=l2 sig_type=std_logic lab=hn_pin}
C {devices/lab_pin.sym} 500 350 0 0 {name=l8 sig_type=std_logic lab=hp_pin}
C {../../symbols/straight_heater_metal_simple.sym} 950 1060 0 0 {name=heater3
length=320.0u
length_undercut_spacing=6.0u
length_undercut=30.0u
heater_taper_length=5.0u
model=straight_heater_metal_simple
spiceprefix=P}
C {devices/lab_pin.sym} 1030 610 0 0 {name=l3 sig_type=std_logic lab=hn_pin}
C {devices/lab_pin.sym} 1610 660 0 1 {name=l9 sig_type=std_logic lab=hp_pin}
C {../../symbols/straight_heater_metal_simple.sym} 1680 -310 1 0 {name=heater4
length=320.0u
length_undercut_spacing=6.0u
length_undercut=30.0u
heater_taper_length=5.0u
model=straight_heater_metal_simple
spiceprefix=P}
C {devices/lab_pin.sym} 2080 340 0 0 {name=l12 sig_type=std_logic lab=hn_pin}
C {../../symbols/straight_heater_metal_simple.sym} 2180 50 0 0 {name=heater5
length=320.0u
length_undercut_spacing=6.0u
length_undercut=30.0u
heater_taper_length=5.0u
model=straight_heater_metal_simple
spiceprefix=P}
C {devices/lab_pin.sym} 2130 -230 0 1 {name=l4 sig_type=std_logic lab=hp_pin}
C {devices/lab_pin.sym} 2250 -400 0 0 {name=l10 sig_type=std_logic lab=hn_pin}
C {devices/lab_pin.sym} 2830 -350 0 1 {name=l6 sig_type=std_logic lab=hp_pin}
C {devices/iopin.sym} 2890 -380 0 0 {name=p1 lab=pin2}

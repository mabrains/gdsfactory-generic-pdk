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
N -842.5 -155 -775 -155 {
lab=anode_pin}
N -841.25 -71.25 -773.75 -71.25 {
lab=cathode_pin}
N 120 190 120 235 {
lab=cathode_pin}
N 118.75 -210 118.75 -165 {
lab=cathode_pin}
N 117.5 -600 117.5 -555 {
lab=cathode_pin}
N -510 -650 -400 -650 {
lab=pin1}
N -510 -650 -510 -250 {
lab=pin1}
N -510 -250 -410 -250 {
lab=pin1}
N -670 -250 -510 -250 {
lab=pin1}
N -510 140 -400 140 {
lab=pin1}
N -510 -250 -510 140 {
lab=pin1}
N 40 -700 180 -700 {
lab=anode_pin}
N 110 -750 110 -700 {
lab=anode_pin}
N 40 -600 180 -600 {
lab=cathode_pin}
N 620 -650 730 -650 {
lab=#net1}
N 730 -650 730 140 {
lab=#net1}
N 650 140 730 140 {
lab=#net1}
N 620 -260 730 -260 {
lab=#net1}
N 30 -310 180 -310 {
lab=anode_pin}
N 30 -310 30 -300 {
lab=anode_pin}
N 120 -350 120 -310 {
lab=anode_pin}
N 30 -210 180 -210 {
lab=cathode_pin}
N 30 -210 30 -200 {
lab=cathode_pin}
N 40 90 210 90 {
lab=anode_pin}
N 130 50 130 90 {
lab=anode_pin}
N 50 190 210 190 {
lab=cathode_pin}
N 40 190 50 190 {
lab=cathode_pin}
N 730 -260 860 -260 {
lab=#net1}
C {devices/title.sym} -440 350 0 0 {name=l5 author="Mabrains Authors"}
C {devices/iopin.sym} -840 -71.25 2 0 {name=p3 lab=cathode_pin}
C {devices/iopin.sym} -840 -155 2 0 {name=p4 lab=anode_pin}
C {devices/lab_pin.sym} -775 -155 0 1 {name=l1 sig_type=std_logic lab=anode_pin}
C {devices/lab_pin.sym} -773.75 -71.25 0 1 {name=l2 sig_type=std_logic lab=cathode_pin}
C {devices/lab_pin.sym} 120 235 0 0 {name=l3 sig_type=std_logic lab=cathode_pin}
C {devices/lab_pin.sym} 118.75 -165 0 0 {name=l6 sig_type=std_logic lab=cathode_pin}
C {devices/lab_pin.sym} 117.5 -555 0 0 {name=l7 sig_type=std_logic lab=cathode_pin}
C {../../symbols/ge_detector_straight_si_contacts.sym} -630 -270 0 0 {name=detector3
length=80.0u
via_stack_width=10.0u
via_stack_spacing=5.0u
via_stack_offset=0.0u
model=ge_detector_straight_si_contacts
spiceprefix=P}
C {../../symbols/ge_detector_straight_si_contacts.sym} -640 130 0 0 {name=detector1
length=80.0u
via_stack_width=10.0u
via_stack_spacing=5.0u
via_stack_offset=0.0u
model=ge_detector_straight_si_contacts
spiceprefix=P}
C {../../symbols/ge_detector_straight_si_contacts.sym} -630 520 0 0 {name=detector2
length=80.0u
via_stack_width=10.0u
via_stack_spacing=5.0u
via_stack_offset=0.0u
model=ge_detector_straight_si_contacts
spiceprefix=P}
C {devices/iopin.sym} -660 -250 0 1 {name=p1 lab=pin1}
C {../../symbols/ge_detector_straight_si_contacts.sym} 850 -270 0 1 {name=detector6
length=80.0u
via_stack_width=10.0u
via_stack_spacing=5.0u
via_stack_offset=0.0u
model=ge_detector_straight_si_contacts
spiceprefix=P}
C {../../symbols/ge_detector_straight_si_contacts.sym} 850 120 0 1 {name=detector4
length=80.0u
via_stack_width=10.0u
via_stack_spacing=5.0u
via_stack_offset=0.0u
model=ge_detector_straight_si_contacts
spiceprefix=P}
C {../../symbols/ge_detector_straight_si_contacts.sym} 880 520 0 1 {name=detector5
length=80.0u
via_stack_width=10.0u
via_stack_spacing=5.0u
via_stack_offset=0.0u
model=ge_detector_straight_si_contacts
spiceprefix=P}
C {devices/lab_pin.sym} 110 -750 0 0 {name=l9 sig_type=std_logic lab=anode_pin}
C {devices/lab_pin.sym} 120 -350 0 0 {name=l10 sig_type=std_logic lab=anode_pin}
C {devices/lab_pin.sym} 130 50 0 0 {name=l8 sig_type=std_logic lab=anode_pin}
C {devices/iopin.sym} 860 -260 0 0 {name=p2 lab=pin2}

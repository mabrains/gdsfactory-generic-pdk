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
N -1130 -1130 -1130 -1080 {
lab=pin1}
N -1270 -1130 -1130 -1130 {
lab=pin1}
N -1090 -720 -1090 -490 {
lab=#net1}
N -1090 -490 -1010 -490 {
lab=#net1}
N -1170 -420 -1010 -420 {
lab=#net2}
N -1170 -720 -1170 -420 {
lab=#net2}
N -720 -420 -450 -420 {
lab=#net3}
N -720 -490 -570 -490 {
lab=#net4}
N -570 -670 -570 -490 {
lab=#net4}
N -570 -670 -550 -670 {
lab=#net4}
N -190 -420 -80 -420 {
lab=#net5}
N -70 -370 -10 -370 {
lab=pin2}
N -70 -370 -70 -130 {
lab=pin2}
N -70 -130 -30 -130 {
lab=pin2}
N 440 -470 600 -470 {
lab=pin3}
N 600 -470 600 -130 {
lab=pin3}
N 360 -130 600 -130 {
lab=pin3}
N 510 -420 680 -420 {
lab=#net6}
N -140 -130 -70 -130 {
lab=pin2}
N 600 -130 600 -80 {
lab=pin3}
N 530 -80 600 -80 {
lab=pin3}
N -170 -670 -100 -670 {
lab=#net7}
N 260 -670 340 -670 {
lab=pin2}
C {../../symbols/coupler_full.sym} -1170 -10 0 0 {name=coupler_full1
coupling_length=40.0u
dx=10.0u
dy=4.8u
gap=0.5u
dw=0.1u
model=coupler_full
spiceprefix=P}
C {../../symbols/dbr_tapered.sym} -400 -410 0 0 {name=dbr_tapered1
length=10.0u
period=0.85
duty_cycle=0.5
w1=0.4u
w2=1.0u
taper_length=20.0u
model=dbr_tapered
spiceprefix=P}
C {../../symbols/interdigital_capacitor.sym} 30 -110 0 0 {name=interdigital_capacitor1
fingers=4
finger_length=20.0u
finger_gap=2.0u
thickness=5.0u
model=interdigital_capacitor
spiceprefix=P}
C {../../symbols/mmi1x2.sym} -1300 -520 0 0 {name=mmi1
width_mmi=2.5u
length_mmi=5.5u
gap_mmi=0.25u
width=0.5u
width_taper=1u
length_taper=10u
model=mmi1x2
spiceprefix=P}
C {../../symbols/ring_single_heater.sym} -470 -440 0 0 {name=ring1
gap=0.2u
radius=10.0u
length_x=4.0u
length_y=0.6u
model=ring_single_heater
spiceprefix=P}
C {../../symbols/straight_pin_slot.sym} -180 -40 0 0 {name=pin1
length=500.0u
via_stack_width=10.0u
via_stack_slab_width=10.0u
via_stack_spacing=2u
via_stack_slab_spacing=2.0u
model=straight_pin_slot
spiceprefix=P}
C {devices/iopin.sym} -1266.25 -1130 0 1 {name=p1 lab=pin1}
C {../../symbols/grating_coupler_rectangular.sym} 710 -410 0 0 {name=grating_coupler_rectangular1
n_periods=20
period=0.75
fill_factor=0.5
width_grating=11.0u
length_taper=150.0u
wavelength=1.55u
fiber_angle=15
slab_xmin=-1.0u
slab_offset=1.0u
model=grating_coupler_rectangular
spiceprefix=P}
C {devices/iopin.sym} -136.25 -130 0 1 {name=p2 lab=pin2}
C {devices/iopin.sym} 533.75 -80 0 1 {name=p3 lab=pin3}
C {../../symbols/mzm.sym} -10 -680 0 0 {name=mzm1
length_x=500u
length_y=2.0u
delta_length=0.0u
model=mzm
spiceprefix=P}
C {devices/iopin.sym} 333.75 -670 0 0 {name=p4 lab=pin4}

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
N -580 -730 -470 -730 {
lab=pin2}
N -570 -790 -470 -790 {
lab=pin1}
N -470 -790 -470 -780 {
lab=pin1}
N 0 -800 60 -800 {
lab=#net1}
N 60 -840 60 -800 {
lab=#net1}
N -490 -590 40 -590 {
lab=#net2}
N -450 -230 -450 -160 {
lab=#net3}
N -490 -230 -490 -100 {
lab=#net4}
N -450 -160 -200 -160 {
lab=#net3}
N -490 -100 -260 -100 {
lab=#net4}
N 1400 -830 1480 -830 {
lab=pin3}
N 100 -590 100 -160 {
lab=#net2}
N 40 -590 100 -590 {
lab=#net2}
N 160 -100 710 -100 {
lab=#net5}
N 710 -180 710 -100 {
lab=#net5}
N 100 -750 100 -590 {
lab=#net2}
N 0 -750 100 -750 {
lab=#net2}
N 1400 -850 1480 -850 {
lab=pin3}
N 710 -840 1100 -840 {}
N 710 -840 710 -770 {}
C {devices/title.sym} -440 350 0 0 {name=l5 author="Mabrains Authors"}
C {devices/iopin.sym} -566.25 -790 0 1 {name=p1 lab=pin1}
C {devices/iopin.sym} -566.25 -730 0 1 {name=p2 lab=pin2}
C {../../symbols/straight_heater_meander.sym} -600 -340 0 0 {name=heater1
length=300.0u
spacing=2.0u
heater_width=2.5u
extension_length=15.0u
radius=90u
heater_taper_length=10.0u
taper_length=10.0u
model=straight_heater_meander
spiceprefix=P}
C {../../symbols/grating_coupler_elliptical_lumerical.sym} 70 -880 3 0 {name=grating_coupler_elliptical_lumerical1
parameters="[-2.43, 0.1, 0.48]"
taper_angle=55.0
taper_length=12.6u
fiber_angle=5.0
bias_gap=0.0u
wavelength=1.554u
model=grating_coupler_elliptical_lumerical
spiceprefix=P"}
C {../../symbols/polarization_splitter_rotator.sym} -920 -690 1 0 {name=rotator1
width_taper_in1=0.54u
width_taper_in2=0.69u
width_taper_in3=0.83u
length_taper_in1=4.0u
length_taper_in2=44.0u
length_taper_in3=44.0u
width_coupler_top=0.9u
width_coupler_bottom=0.405u
length_coupler=7.0u
gap=0.15u
width_out=0.54u
length_out=14.33u
dy=5.0u
model=polarization_splitter_rotator
spiceprefix=P}
C {devices/iopin.sym} 1473.75 -830 0 0 {name=p4 lab=pin4}
C {../../symbols/mode_converter.sym} -350 320 0 0 {name=mode_converter1
gap=0.3u
length=10.0u
mm_width=1.2u
mc_mm_width=1.0u
sm_width=0.5u
model=mode_converter
spiceprefix=P}
C {../../symbols/disk_heater.sym} 1230 -360 3 0 {name=disk1
radius=10.0u
gap=0.2u
wrap_angle_deg=180.0
parity=1
heater_width=5.0u
heater_extent=2.0u
model=disk_heater
spiceprefix=P}
C {../../symbols/mzi1x2_2x2.sym} 1190 -850 0 0 {name=mzi1
delta_length=10.0u
length_x=0.1u
length_y=2.0u
model=mzi1x2_2x2
spiceprefix=P}
C {devices/iopin.sym} 1473.75 -850 0 0 {name=p3 lab=pin3}

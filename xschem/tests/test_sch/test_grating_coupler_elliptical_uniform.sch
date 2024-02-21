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
N -510 -640 -400 -640 {
lab=pin1}
N -510 150 -390 150 {
lab=pin1}
N -510 -640 -510 150 {
lab=pin1}
N -510 -240 -400 -240 {
lab=pin1}
N -660 -240 -510 -240 {
lab=pin1}
N 610 -660 740 -660 {
lab=#net1}
N 740 -660 740 130 {
lab=#net1}
N 610 130 740 130 {
lab=#net1}
N 600 -260 740 -260 {
lab=#net1}
N 740 -260 870 -260 {
lab=#net1}
N -400 -640 -390 -640 {}
N -400 -240 -390 -240 {}
N -390 150 -380 150 {}
N 600 130 610 130 {}
N 590 -260 600 -260 {}
N 600 -660 610 -660 {}
C {devices/title.sym} -440 350 0 0 {name=l5 author="Mabrains Authors"}
C {../../symbols/grating_coupler_elliptical_uniform.sym} -360 -230 0 0 {name=grating_coupler_elliptical_uniform1
n_periods=20
period=0.75
fill_factor=0.5
taper_length=16.6u
taper_angle=60.0
wavelength=1.554u
fiber_angle=15.0
taper_to_slab_offset=-3.0u
bias_gap=0.0u
model=grating_coupler_elliptical_uniform
spiceprefix=P}
C {../../symbols/grating_coupler_elliptical_uniform.sym} -350 160 0 0 {name=grating_coupler_elliptical_uniform2
n_periods=20
period=0.75
fill_factor=0.5
taper_length=16.6u
taper_angle=60.0
wavelength=1.554u
fiber_angle=15.0
taper_to_slab_offset=-3.0u
bias_gap=0.0u
model=grating_coupler_elliptical_uniform
spiceprefix=P}
C {../../symbols/grating_coupler_elliptical_uniform.sym} -360 -630 0 0 {name=grating_coupler_elliptical_uniform3
n_periods=20
period=0.75
fill_factor=0.5
taper_length=16.6u
taper_angle=60.0
wavelength=1.554u
fiber_angle=15.0
taper_to_slab_offset=-3.0u
bias_gap=0.0u
model=grating_coupler_elliptical_uniform
spiceprefix=P}
C {../../symbols/grating_coupler_elliptical_uniform.sym} 560 -250 0 1 {name=grating_coupler_elliptical_uniform4
n_periods=20
period=0.75
fill_factor=0.5
taper_length=16.6u
taper_angle=60.0
wavelength=1.554u
fiber_angle=15.0
taper_to_slab_offset=-3.0u
bias_gap=0.0u
model=grating_coupler_elliptical_uniform
spiceprefix=P}
C {../../symbols/grating_coupler_elliptical_uniform.sym} 570 140 0 1 {name=grating_coupler_elliptical_uniform5
n_periods=20
period=0.75
fill_factor=0.5
taper_length=16.6u
taper_angle=60.0
wavelength=1.554u
fiber_angle=15.0
taper_to_slab_offset=-3.0u
bias_gap=0.0u
model=grating_coupler_elliptical_uniform
spiceprefix=P}
C {../../symbols/grating_coupler_elliptical_uniform.sym} 570 -650 0 1 {name=grating_coupler_elliptical_uniform6
n_periods=20
period=0.75
fill_factor=0.5
taper_length=16.6u
taper_angle=60.0
wavelength=1.554u
fiber_angle=15.0
taper_to_slab_offset=-3.0u
bias_gap=0.0u
model=grating_coupler_elliptical_uniform
spiceprefix=P}
C {devices/iopin.sym} -650 -240 0 1 {name=p1 lab=pin1}
C {devices/iopin.sym} 860 -260 0 0 {name=p2 lab=pin2}

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
C {devices/title.sym} -440 350 0 0 {name=l5 author="Mabrains Authors"}
C {../../symbols/grating_coupler_elliptical.sym} -360 -230 0 0 {name=grating_coupler_elliptical1
taper_length=16.6u
taper_angle=40.0
wavelength=1.554u
fiber_angle=15.0
grating_line_width=0.343u
n_periods=30
slab_xmin=-1.0u
slab_offset=2.0u
model=grating_coupler_elliptical
spiceprefix=P}
C {../../symbols/grating_coupler_elliptical.sym} -350 160 0 0 {name=grating_coupler_elliptical2
taper_length=16.6u
taper_angle=40.0
wavelength=1.554u
fiber_angle=15.0
grating_line_width=0.343u
n_periods=30
slab_xmin=-1.0u
slab_offset=2.0u
model=grating_coupler_elliptical
spiceprefix=P}
C {../../symbols/grating_coupler_elliptical.sym} -360 -630 0 0 {name=grating_coupler_elliptical3
taper_length=16.6u
taper_angle=40.0
wavelength=1.554u
fiber_angle=15.0
grating_line_width=0.343u
n_periods=30
slab_xmin=-1.0u
slab_offset=2.0u
model=grating_coupler_elliptical
spiceprefix=P}
C {../../symbols/grating_coupler_elliptical.sym} 560 -250 0 1 {name=grating_coupler_elliptical4
taper_length=16.6u
taper_angle=40.0
wavelength=1.554u
fiber_angle=15.0
grating_line_width=0.343u
n_periods=30
slab_xmin=-1.0u
slab_offset=2.0u
model=grating_coupler_elliptical
spiceprefix=P}
C {../../symbols/grating_coupler_elliptical.sym} 570 140 0 1 {name=grating_coupler_elliptical5
taper_length=16.6u
taper_angle=40.0
wavelength=1.554u
fiber_angle=15.0
grating_line_width=0.343u
n_periods=30
slab_xmin=-1.0u
slab_offset=2.0u
model=grating_coupler_elliptical
spiceprefix=P}
C {../../symbols/grating_coupler_elliptical.sym} 570 -650 0 1 {name=grating_coupler_elliptical6
taper_length=16.6u
taper_angle=40.0
wavelength=1.554u
fiber_angle=15.0
grating_line_width=0.343u
n_periods=30
slab_xmin=-1.0u
slab_offset=2.0u
model=grating_coupler_elliptical
spiceprefix=P}
C {devices/iopin.sym} -650 -240 0 1 {name=p1 lab=pin1}
C {devices/iopin.sym} 860 -260 0 0 {name=p2 lab=pin2}

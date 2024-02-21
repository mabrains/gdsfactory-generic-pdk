v {xschem version=3.1.0 file_version=1.2 

* Copyright 2022 GlobalFoundries PDK Authors
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     https://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.

}
G {}
K {}
V {}
S {}
E {}
L 7 4160 -960 4570 -960 {}
L 7 80 -960 4160 -960 {}
L 7 510 -850 510 -180 {}
L 7 1160 -850 1160 -180 {}
L 7 2210 -850 2210 -180 {}
L 7 2650 -840 2650 -170 {}
L 7 80 -1710 80 -1040 {}
L 7 90 -850 90 -180 {}
L 7 950 -850 950 -180 {}
L 7 940 -1710 940 -1040 {}
L 7 1440 -1700 1440 -1030 {}
L 7 500 -1720 500 -1050 {}
L 7 1900 -1700 1900 -1030 {}
L 7 2340 -1700 2340 -1030 {}
L 7 2750 -1700 2750 -1030 {}
L 7 3240 -1710 3240 -1040 {}
L 7 3650 -1710 3650 -1040 {}
L 7 4060 -1710 4060 -1040 {}
L 7 4500 -810 4500 -140 {}
L 7 4500 -1720 4500 -1050 {}
T {MMI} 120 -940 0 0 0.8 0.8 {}
T {MZI} 550 -940 0 0 0.8 0.8 {}
T {Heater} 1200 -940 0 0 0.8 0.8 {}
T {Ring} 2230 -940 0 0 0.8 0.8 {}
T {Coupler} 2680 -940 0 0 0.8 0.8 {}
T {MZM} 980 -940 0 0 0.8 0.8 {}
T {Reflector} 80 -1690 0 0 0.8 0.8 {}
T {Detector} 990 -1690 0 0 0.8 0.8 {}
T {Resonator} 530 -1680 0 0 0.8 0.8 {}
T {Capacitor} 1470 -1690 0 0 0.8 0.8 {}
T {Resistance} 1920 -1690 0 0 0.8 0.8 {}
T {Mode_Converter} 2360 -1670 0 0 0.8 0.8 {}
T {Rotator} 2770 -1680 0 0 0.8 0.8 {}
T {PIN} 3260 -1680 0 0 0.8 0.8 {}
T {PN} 3670 -1680 0 0 0.8 0.8 {}
T {General_tests} 4110 -1690 0 0 0.8 0.8 {}
C {test_sch/test_mmi1x2.sym} 290 -660 0 0 {name=x1}
C {devices/title.sym} 160 -30 0 0 {name=l5 author="Mabrains Authors"}
C {devices/launcher.sym} 130 -1910 0 0 {name=h1
descr="List of devices (Google docs)"
url="https://docs.google.com/spreadsheets/d/1Rp77UNHrHiQSDsKXBeNxQnVkOiLgrTtywIjWb5KaUJE/edit#gid=735012245"}
C {devices/launcher.sym} 130 -1860 0 0 {name=h2
descr="Github"
url="https://github.com/mabrains/gdsfactory-generic_pdk"}
C {test_sch/test_mmi2x2.sym} 190 -780 0 0 {name=x2}
C {test_sch/test_mmi1x2_with_sbend.sym} 250 -460 0 0 {name=x3}
C {test_sch/test_mmi2x2_with_sbend.sym} 140 -220 0 0 {name=x4}
C {test_sch/test_mmi_90degree_hybrid.sym} 150 -380 0 0 {name=x5}
C {test_sch/test_mzi.sym} 630 -780 0 0 {name=x6}
C {test_sch/test_mzi1x2_2x2.sym} 640 -630 0 0 {name=x7}
C {test_sch/test_mzi2x2_2x2_phase_shifter.sym} 580 -210 0 0 {name=x8}
C {test_sch/test_mzi_phase_shifter.sym} 590 -350 0 0 {name=x9}
C {test_sch/test_mzit.sym} 640 -490 0 0 {name=x10}
C {test_sch/test_mzm.sym} 1020 -610 1 0 {name=x11}
C {test_sch/test_ring_double.sym} 2310 -690 0 0 {name=x12}
C {test_sch/test_ring_double_heater.sym} 2270 -320 0 0 {name=x13}
C {test_sch/test_ring_double_pn.sym} 2280 -410 0 0 {name=x14}
C {test_sch/test_ring_single.sym} 2310 -790 0 0 {name=x15}
C {test_sch/test_ring_single_bend_coupler.sym} 2270 -220 0 0 {name=x16}
C {test_sch/test_ring_single_heater.sym} 2280 -500 0 0 {name=x17}
C {test_sch/test_ring_single_pn.sym} 2280 -600 0 0 {name=x18}
C {test_sch/test_straight_heater_doped_rib.sym} 1280 -730 0 0 {name=x19}
C {test_sch/test_straight_heater_doped_strip.sym} 1280 -590 0 0 {name=x20}
C {test_sch/test_straight_heater_meander.sym} 1280 -460 0 0 {name=x21}
C {test_sch/test_straight_heater_meander_doped.sym} 1280 -330 0 0 {name=x22}
C {test_sch/test_straight_heater_metal.sym} 1270 -190 0 0 {name=x23}
C {test_sch/test_straight_heater_metal_90_90.sym} 1770 -700 0 0 {name=x24}
C {test_sch/test_straight_heater_metal_simple.sym} 1750 -550 0 0 {name=x25}
C {test_sch/test_straight_heater_metal_undercut.sym} 1750 -400 0 0 {name=x26}
C {test_sch/test_straight_heater_metal_undercut_90_90.sym} 1730 -250 0 0 {name=x27}
C {test_sch/test_cdc.sym} 3120 -580 0 0 {name=x28}
C {test_sch/test_coupler.sym} 3120 -390 0 0 {name=x29}
C {test_sch/test_coupler_adiabatic.sym} 3090 -230 0 0 {name=x30}
C {test_sch/test_coupler_bent.sym} 2700 -590 0 0 {name=x31}
C {test_sch/test_coupler_broadband.sym} 2710 -410 0 0 {name=x32}
C {test_sch/test_coupler_full.sym} 2700 -240 0 0 {name=x33}
C {test_sch/test_coupler_ring.sym} 3050 -760 0 0 {name=x34}
C {test_sch/test_grating_coupler_elliptical.sym} 3560 -220 0 0 {name=x35}
C {test_sch/test_grating_coupler_elliptical_arbitrary.sym} 4030 -210 0 0 {name=x36}
C {test_sch/test_grating_coupler_elliptical_lumerical.sym} 3470 -760 0 0 {name=x37}
C {test_sch/test_grating_coupler_elliptical_trenches.sym} 3470 -570 0 0 {name=x38}
C {test_sch/test_grating_coupler_elliptical_uniform.sym} 3480 -390 0 0 {name=x39}
C {test_sch/test_grating_coupler_rectangular.sym} 4040 -760 0 0 {name=x40}
C {test_sch/test_grating_coupler_rectangular_arbitrary.sym} 3970 -560 0 0 {name=x41}
C {test_sch/test_grating_coupler_rectangular_arbitrary_slab.sym} 3960 -380 0 0 {name=x42}
C {test_sch/test_dbr.sym} 180 -1460 0 0 {name=x43}
C {test_sch/test_dbr_tapered.sym} 170 -1280 0 0 {name=x44}
C {test_sch/test_disk.sym} 660 -1440 0 0 {name=x46}
C {test_sch/test_disk_heater.sym} 660 -1240 0 0 {name=x47}
C {test_sch/test_ge_detector_straight_si_contacts.sym} 1010 -1330 0 0 {name=x45}
C {test_sch/test_resistance_sheet.sym} 2010 -1370 0 0 {name=x49}
C {test_sch/test_interdigital_capacitor.sym} 1530 -1320 0 0 {name=x48}
C {test_sch/test_mode_converter.sym} 2420 -1340 0 0 {name=x50}
C {test_sch/test_polarization_splitter_rotator.sym} 2820 -1350 0 0 {name=x51}
C {test_sch/test_straight_pin.sym} 3320 -1460 0 0 {name=x52}
C {test_sch/test_straight_pin_slot.sym} 3320 -1300 0 0 {name=x53}
C {test_sch/test_straight_pn.sym} 3720 -1360 0 0 {name=x54}
C {test_sch/test_general1.sym} 4150 -1560 0 0 {name=x55}
C {test_sch/test_general2.sym} 4140 -1430 0 0 {name=x56}
C {test_sch/test_general3.sym} 4120 -1290 0 0 {name=x57}
C {test_sch/test_general4.sym} 4140 -1140 0 0 {name=x58}

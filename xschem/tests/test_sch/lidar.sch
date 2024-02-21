v {xschem version=3.1.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N -110 -540 40 -540 {
lab=#net1}
N -200 -200 -130 -200 {
lab=#net1}
N -130 -540 -130 -200 {
lab=#net1}
N -130 -540 -110 -540 {
lab=#net1}
N -200 -120 -130 -120 {
lab=#net2}
N -130 -120 -130 190 {
lab=#net2}
N -130 190 40 190 {
lab=#net2}
N 400 -500 590 -500 {
lab=#net3}
N 590 -500 590 -420 {
lab=#net3}
N 590 -420 630 -420 {
lab=#net3}
N 400 150 590 150 {
lab=#net4}
N 400 230 590 230 {
lab=#net5}
N 590 230 590 310 {
lab=#net5}
N 590 310 630 310 {
lab=#net5}
N -660 -160 -560 -160 {
lab=o_in}
N 1530 -440 3560 -440 {
lab=#net10}
N 3560 -700 3560 -440 {
lab=#net10}
N 3560 -700 3580 -700 {
lab=#net10}
N 1490 -600 2260 -600 {
lab=#net11}
N 2260 -690 2260 -600 {
lab=#net11}
N 1530 290 1530 780 {
lab=#net12}
N 1530 780 2270 780 {
lab=#net12}
N 2270 660 2270 780 {
lab=#net12}
N 1490 130 3340 130 {
lab=#net13}
N 3340 130 3340 660 {
lab=#net13}
N 3340 660 3580 660 {
lab=#net13}
N -600 -1160 -490 -1160 {
lab=GND}
N -600 -1070 -490 -1070 {
lab=h1}
N -600 -960 -490 -960 {
lab=h2}
N -600 -880 -490 -880 {
lab=h3}
N -600 -780 -490 -780 {
lab=h4}
N 520 -630 590 -630 {
lab=h1}
N 1060 -600 1130 -600 {
lab=GND}
N 1100 -440 1170 -440 {
lab=GND}
N 1060 130 1130 130 {
lab=GND}
N 1100 290 1100 360 {
lab=GND}
N 560 -470 630 -470 {
lab=h2}
N 520 100 590 100 {
lab=h3}
N 560 260 630 260 {
lab=h4}
N 400 -580 590 -580 {
lab=#net14}
N 1100 240 1270 240 {}
N 1270 240 1270 290 {}
N 1060 80 1230 80 {}
N 1230 80 1230 130 {}
N 1060 -650 1230 -650 {}
N 1230 -650 1230 -600 {}
N 1100 -490 1270 -490 {}
N 1270 -490 1270 -440 {}
C {../../symbols/mmi1x2.sym} 0 10 3 0 {name=mmi1
width_mmi=2.5u
length_mmi=5.5u
gap_mmi=0.25u
width=0.5u
width_taper=1u
length_taper=10u
model=mmi1x2
spiceprefix=P}
C {../../symbols/mmi1x2.sym} 600 -370 3 0 {name=mmi2
width_mmi=2.5u
length_mmi=5.5u
gap_mmi=0.25u
width=0.5u
width_taper=1u
length_taper=10u
model=mmi1x2
spiceprefix=P}
C {../../symbols/mmi1x2.sym} 600 360 3 0 {name=mmi3
width_mmi=2.5u
length_mmi=5.5u
gap_mmi=0.25u
width=0.5u
width_taper=1u
length_taper=10u
model=mmi1x2
spiceprefix=P}
C {../../symbols/straight_heater_meander.sym} 460 -190 0 0 {name=heater1
length=300.0u
spacing=2.0u
heater_width=2.5u
extension_length=15.0u
radius=90u
heater_taper_length=10.0u
taper_length=10.0u
model=straight_heater_meander
spiceprefix=P}
C {../../symbols/straight_heater_meander.sym} 500 -30 0 0 {name=heater2
length=300.0u
spacing=2.0u
heater_width=2.5u
extension_length=15.0u
radius=90u
heater_taper_length=10.0u
taper_length=10.0u
model=straight_heater_meander
spiceprefix=P}
C {../../symbols/straight_heater_meander.sym} 460 540 0 0 {name=heater3
length=300.0u
spacing=2.0u
heater_width=2.5u
extension_length=15.0u
radius=90u
heater_taper_length=10.0u
taper_length=10.0u
model=straight_heater_meander
spiceprefix=P}
C {../../symbols/straight_heater_meander.sym} 500 700 0 0 {name=heater4
length=300.0u
spacing=2.0u
heater_width=2.5u
extension_length=15.0u
radius=90u
heater_taper_length=10.0u
taper_length=10.0u
model=straight_heater_meander
spiceprefix=P}
C {../../symbols/dbr.sym} 1280 -590 0 0 {name=dbr1
w1=0.476u
w2=0.524u
l1=0.159u
l2=0.159u
n=100
model=dbr
spiceprefix=P}
C {../../symbols/dbr.sym} 1320 -430 0 0 {name=dbr2
w1=0.476u
w2=0.524u
l1=0.159u
l2=0.159u
n=100
model=dbr
spiceprefix=P}
C {../../symbols/dbr.sym} 1280 140 0 0 {name=dbr3
w1=0.476u
w2=0.524u
l1=0.159u
l2=0.159u
n=100
model=dbr
spiceprefix=P}
C {../../symbols/dbr.sym} 1320 300 0 0 {name=dbr4
w1=0.476u
w2=0.524u
l1=0.159u
l2=0.159u
n=100
model=dbr
spiceprefix=P}
C {devices/iopin.sym} -650 -160 0 1 {name=p2 lab=o_in}
C {../../symbols/grating_coupler_elliptical.sym} 2270 -730 3 0 {name=grating_coupler_elliptical1
taper_length=15u
taper_angle=40.0
wavelength=1.554u
fiber_angle=15.0
grating_line_width=0.343u
n_periods=30
slab_xmin=-1.0u
slab_offset=2.0u
model=grating_coupler_elliptical
spiceprefix=P}
C {../../symbols/grating_coupler_elliptical.sym} 3590 -740 3 0 {name=grating_coupler_elliptical5
taper_length=15u
taper_angle=40.0
wavelength=1.554u
fiber_angle=15.0u
grating_line_width=0.343u
n_periods=30
slab_xmin=-1.0u
slab_offset=2.0u
model=grating_coupler_elliptical
spiceprefix=P}
C {../../symbols/grating_coupler_elliptical.sym} 2280 620 3 0 {name=grating_coupler_elliptical6
taper_length=15u
taper_angle=40.0
wavelength=1.554u
fiber_angle=15.0u
grating_line_width=0.343u
n_periods=30
slab_xmin=-1.0u
slab_offset=2.0u
model=grating_coupler_elliptical
spiceprefix=P}
C {../../symbols/grating_coupler_elliptical.sym} 3590 620 3 0 {name=grating_coupler_elliptical7
taper_length=15u
taper_angle=40.0u
wavelength=1.554u
fiber_angle=15.0
grating_line_width=0.343u
n_periods=30
slab_xmin=-1.0u
slab_offset=2.0u
model=grating_coupler_elliptical
spiceprefix=P}
C {devices/iopin.sym} -600 -1160 0 1 {name=p3 lab=GND}
C {devices/iopin.sym} -600 -1070 0 1 {name=p4 lab=h1}
C {devices/iopin.sym} -600 -960 0 1 {name=p5 lab=h2}
C {devices/iopin.sym} -600 -880 0 1 {name=p6 lab=h3}
C {devices/iopin.sym} -600 -780 0 1 {name=p7 lab=h4}
C {devices/lab_pin.sym} -490 -1160 0 1 {name=l1 sig_type=std_logic lab=GND
}
C {devices/lab_pin.sym} -490 -1070 0 1 {name=l2 sig_type=std_logic lab=h1
}
C {devices/lab_pin.sym} -490 -960 0 1 {name=l3 sig_type=std_logic lab=h2}
C {devices/lab_pin.sym} -490 -880 0 1 {name=l4 sig_type=std_logic lab=h3
}
C {devices/lab_pin.sym} -490 -780 0 1 {name=l5 sig_type=std_logic lab=h4

}
C {devices/lab_pin.sym} 520 -630 0 0 {name=l6 sig_type=std_logic lab=h1}
C {devices/lab_pin.sym} 1130 -600 0 1 {name=l7 sig_type=std_logic lab=GND}
C {devices/lab_pin.sym} 1170 -440 0 1 {name=l8 sig_type=std_logic lab=GND}
C {devices/lab_pin.sym} 1130 130 0 1 {name=l9 sig_type=std_logic lab=GND}
C {devices/lab_pin.sym} 1100 360 1 1 {name=l10 sig_type=std_logic lab=GND}
C {devices/lab_pin.sym} 560 -470 0 0 {name=l11 sig_type=std_logic lab=h2}
C {devices/lab_pin.sym} 520 100 0 0 {name=l12 sig_type=std_logic lab=h3}
C {devices/lab_pin.sym} 560 260 0 0 {name=l13 sig_type=std_logic lab=h4}

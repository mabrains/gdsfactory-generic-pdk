Klayout-LVS
===========

Explains how to use the Generic-PDK LVS.


# Table of contents
- [Klayout-LVS](#klayout-lvs)
- [Table of contents](#table-of-contents)
  - [Folder Structure](#folder-structure)
  - [Devices Status](#devices-status)
  - [Usage](#usage)
    - [CLI](#cli)
      - [Options](#options)
      - [LVS Outputs](#lvs-outputs)
    - [GUI](#gui)
  - [Demo-Example](#demo-example)
    - [Schematic](#schematic)
    - [Layout](#layout)
    - [LVS-Testing](#lvs-testing)
      - [CLI](#cli-1)
      - [GUI](#gui-1)


## Folder Structure

```text
📁 lvs
 ┣ 📁testing                        Testing environment directory for GenericPDK LVS. 
 ┣ 📁rule_decks                     All LVS rule decks used in GenericPDK.
 ┣ generic_tech.lvs                 Main LVS runset that call all rule decks.
 ┣ 📜README.md                      This file to document the LVS run for GenericPDK.
 ┗ 📜run_lvs.py                     Main python script used for GenericPDK LVS.
 ```


## Devices Status

The following table explains the list of available Generic-PDK device we have supported in our LVS runset.

| Device Name                | Measured-Parameters                                        | Tested            |
|----------------------------|------------------------------------------------------------|-------------------|
| mmi1x2                     | `length_mmi, width_mmi, gap_mmi, width_taper, length_taper`|:white_check_mark: |
| straight_heater_meander    | `heater_width`                                             |:white_check_mark: |
| dbr                        | `w1, w2, l1, l2, n`                                        |:white_check_mark: |
| grating_coupler_elliptical | `taper_length`                                             |:white_check_mark: |
| disk                       | `radius, gap`                                              |:white_check_mark: |
| coupler                    | `gap, length, dx, dy`                                      |:white_check_mark: |

> **Note:** All supported devices include marker layers utilized for LVS purposes, which are added automatically through the [GenericPDK Pcells](../pymacros/README.md). If you've implemented these devices using an alternative method, you'll need to manually include these marker layers. Please refer to [GenericPDK-Layers](../README.md#layers) for more info about available layers.

## Usage

You have the option to execute the GenericPDK-LVS through either a Python script via the command-line interface [CLI](#cli) or by the Klayout graphical user interface [GUI](#gui), as detailed in the subsequent usage sections.

### CLI

The `run_lvs.py` script takes your gds and netlist files to run LVS rule decks with switches to select subsets of all checks.

```bash
    run_lvs.py (--help| -h)
    run_lvs.py (--layout=<layout_path>) (--netlist=<netlist_path>)
    [--run_dir=<run_dir_path>] [--topcell=<topcell_name>] [--run_mode=<run_mode>]
    [--no_net_names] [--spice_comments] [--net_only] [--no_simplify]
    [--combine_devices] [--top_lvl_pins] [--purge] [--purge_nets] [--verbose]
```

#### Options

- `--help -h`                         Displays this help message.

- `--layout=<layout_path>`            Specifies the file path of the input GDS file.

- `--netlist=<netlist_path>`          Specifies the file path of the input netlist file.

- `--run_dir=<run_dir_path>`          Run directory to save all the generated results [default: pwd]

- `--topcell=<topcell_name>`          Specifies the name of the top cell to be used.

- `--run_mode=<run_mode>`             Selects the allowed KLayout mode. (flat, deep). [default: flat]

- `--no_net_names`                    Omits net names in the extracted netlist.

- `--spice_comments`                  Includes netlist comments in the extracted netlist.

- `--net_only`                        Generates netlist objects only in the extracted netlist.

- `--no_simplify`                     Disables simplification for both layout and schematic.

- `--combine_devices`                 Enables device combination for both layout and schematic netlists.

- `--top_lvl_pins`                    Creates pins for top-level circuits in both layout and schematic netlists.

- `--purge`                           Removes unused nets from both layout and schematic netlists.

- `--purge_nets`                      Purges floating nets from both layout and schematic netlists.

- `--verbose`                         Enables detailed rule execution logs for debugging purposes.

#### LVS Outputs

You could find the run results at your run directory if you previously specified it through `--run_dir=<run_dir_path>`. Default path of run directory is `lvs_run_<date>_<time>` in current directory.

**Folder Structure of run results**

```text
📁 lvs_run_<date>_<time>
 ┣ 📜 lvs_run_<date>_<time>.log
 ┗ 📜 <your_design_name>.cir
 ┗ 📜 <your_design_name>.lvsdb
 ```

The outcome includes a database file for each device (`<device_name>.lvsdb`) containing LVS extractions and comparison results. You can view it by opening your gds file with: `klayout <device_name>.gds -mn <device_name>.lvsdb`. Alternatively, you can visualize it on your GDS file using the netlist browser option in the tools menu of the KLayout GUI as illustrated in the following figures.

<p align="center">
  <img src="../../images/lvs_marker_1.png" width="50%" >
</p>
<p align="center">
  Fig. 1. Netlist Browser for Klayout-LVS
</p>

After selecting Netlist Browser option, you could load the database file and visualize the LVS results.

<p align="center">
  <img src="../../images/lvs_marker_2.png" width="70%" >
</p>
<p align="center">
  Fig. 2. Loading LVS Netlist/database file - 1
</p>

<p align="center">
  <img src="../../images/lvs_marker_3.png" width="70%" >
</p>
<p align="center">
  Fig. 3. Loading LVS Netlist/database file - 2
</p>

<p align="center">
  <img src="../../images/lvs_results.png" width="70%" >
</p>
<p align="center">
  Fig. 4. Visualize LVS results
</p>

Additionally, you can find the extracted netlist generated from your design at (`<device_name>_extracted.cir`) in the output run directory.

### GUI

The GenericPDK also facilitates LVS execution via Klayout menus, integrated with Klayout through the PDK [installation](../../README.md#installation).

Then, you will get the LVS menus for GenericPDK, you could set your desired options as shown below:

<p align="center">
  <img src="../../images/lvs_menus_1.png" width="70%" >
</p>
<p align="center">
  Fig. 5. Setting up LVS Options-GUI - 1
</p>

<p align="center">
  <img src="../../images/lvs_menus_2.png" width="40%" >
</p>
<p align="center">
  Fig. 6. Setting up LVS Options-GUI - 2
</p>

---
**NOTE**

* To utilize the LVS options, an active cell must be present. The currently active cell is automatically chosen as the default for running LVS. You could change it using `Top Cell` option.
<br/>

* To conduct the LVS comparison, you must specify the path to the schematic netlist via `Netlist Path` option. If no path is provided, the tool will search for the netlist file automatically. It will look for files with extensions such as .cdl, .spice, or .cir in the same directory as the layout file, matching the name of the layout file.

---

For additional details on GUI options, please refer to the [CLI Options section](#cli).

Finally, after setting your option, you could execute the LVS using `Run Klayout LVS` from the dropdown menu.

<p align="center">
  <img src="../../images/lvs_menus_3.png" width="70%" >
</p>
<p align="center">
  Fig. 7. Running LVS using Klayout menus
</p>

Upon executing the LVS, the result database will appear on your layout interface, allowing you to verify the outcome of the run similarly as shown above in Fig. 4.

Additionally, you can find the extracted netlist generated from your design at (`<layout_name>_extracted.cir`) in the same directory as the layout file.

## Demo-Example

The example shows a Lidar device implemented using GenericPDK technology. 

### Schematic

Figure 4 displays the device's [schematic](./testing/testcases/unit/lidar_device/lidar.sch) created using xschem.

<p align="center">
  <img src="../../images/lidar_sch.png" width="100%" >
</p>
<p align="center">
  Fig. 4. Schematic for lidar device using GenericPDK
</p>


**Note**: The netlist will be produced in the selected output directory. It is recommended to launch the tool using the following command:

```bash
xschem lidar.sch -o .
```

This command ensures that the output netlist is generated in the current directory.

Following that, you can generate the netlist from this schematic for LVS testing. This can be accomplished by using the 'netlist' option available in the xschem-GUI, as demonstrated in Figure 5.

<p align="center">
  <img src="../../images/netlist_ext.png" width="100%" >
</p>
<p align="center">
  Fig. 5. Netlist extraction step from xschem for lidar device
</p>

The following netlist the generated from xschem for Lidar device.

```
.subckt lidar o_in GND h1 h2 h3 h4
*.iopin o_in
*.iopin GND
*.iopin h1
*.iopin h2
*.iopin h3
*.iopin h4
Pmmi1 o_in net2 net1 mmi1x2 width=0.5u width_taper=1u length_taper=10u length_mmi=5.5u
+ width_mmi=2.5u gap_mmi=0.25u
Pmmi2 net1 net3 net10 mmi1x2 width=0.5u width_taper=1u length_taper=10u length_mmi=5.5u
+ width_mmi=2.5u gap_mmi=0.25u
Pmmi3 net2 net5 net4 mmi1x2 width=0.5u width_taper=1u length_taper=10u length_mmi=5.5u
+ width_mmi=2.5u gap_mmi=0.25u
Pheater1 net10 net13 h1 GND straight_heater_meander length=300.0u spacing=2.0u heater_width=2.5u
+ extension_length=15.0u radius=90u heater_taper_length=10.0u taper_length=10.0u
Pheater2 net3 net14 h2 GND straight_heater_meander length=300.0u spacing=2.0u heater_width=2.5u
+ extension_length=15.0u radius=90u heater_taper_length=10.0u taper_length=10.0u
Pheater3 net4 net12 h3 GND straight_heater_meander length=300.0u spacing=2.0u heater_width=2.5u
+ extension_length=15.0u radius=90u heater_taper_length=10.0u taper_length=10.0u
Pheater4 net5 net11 h4 GND straight_heater_meander length=300.0u spacing=2.0u heater_width=2.5u
+ extension_length=15.0u radius=90u heater_taper_length=10.0u taper_length=10.0u
Pdbr1 net13 net7 dbr w1=0.476u l1=0.159u w2=0.524u l2=0.159u n=100
Pdbr2 net14 net6 dbr w1=0.476u l1=0.159u w2=0.524u l2=0.159u n=100
Pdbr3 net12 net9 dbr w1=0.476u l1=0.159u w2=0.524u l2=0.159u n=100
Pdbr4 net11 net8 dbr w1=0.476u l1=0.159u w2=0.524u l2=0.159u n=100
Pgrating_coupler_elliptical1 net7 grating_coupler_elliptical taper_length=15u taper_angle=40.0
+ wavelength=1.554u fiber_angle=15.0 grating_line_width=0.343u n_periods=30 slab_xmin=-1.0u slab_offset=2.0u
Pgrating_coupler_elliptical5 net6 grating_coupler_elliptical taper_length=15u taper_angle=40.0
+ wavelength=1.554u fiber_angle=15.0u grating_line_width=0.343u n_periods=30 slab_xmin=-1.0u slab_offset=2.0u
Pgrating_coupler_elliptical6 net8 grating_coupler_elliptical taper_length=15u taper_angle=40.0
+ wavelength=1.554u fiber_angle=15.0u grating_line_width=0.343u n_periods=30 slab_xmin=-1.0u slab_offset=2.0u
Pgrating_coupler_elliptical7 net9 grating_coupler_elliptical taper_length=15u taper_angle=40.0u
+ wavelength=1.554u fiber_angle=15.0 grating_line_width=0.343u n_periods=30 slab_xmin=-1.0u slab_offset=2.0u
.ends
.end
```

### Layout

Figure 6 displays the device's [layout](./testing/testcases/unit/lidar_device/lidar.gds) created using Klayout.

<p align="center">
  <img src="../../images/layout_lidar.png" width="100%" >
</p>
<p align="center">
  Fig. 5. Layout for Lidar device implemented using GenericPDK
</p>

### LVS-Testing

#### CLI

```bash
    python3 run_lvs.py --layout=testing/testcases/unit/lidar_device/lidar.gds --netlist=testing/testcases/unit/lidar_device/lidar.cdl --run_dir=lvs_lidar_run
```

Please refer to [Usage](#usage) section for more details.

#### GUI

You could also run the LVS using Klayout-Menus supported for GenericPDK as explained above in [GUI Section](#gui).

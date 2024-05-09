Klayout-DRC
===========

Explains how to use the Generic-PDK DRC.


# Table of contents
- [Klayout-DRC](#klayout-drc)
- [Table of contents](#table-of-contents)
  - [Folder Structure](#folder-structure)
  - [Usage](#usage)
    - [CLI](#cli)
      - [Options](#options)
      - [DRC Outputs](#drc-outputs)
    - [GUI](#gui)


## Folder Structure

```text
📁 drc
 ┣ 📁testing                        Testing environment directory for GenericPDK DRC. 
 ┣ 📁rule_decks                     All DRC rule decks used in GenericPDK.
 ┣ 📜README.md                      This file to document the DRC run for GenericPDK.
 ┗ 📜run_drc.py                     Main python script used for GenericPDK DRC.
 ```

## Usage

You have the option to execute the GenericPDK-DRC through either a Python script via the command-line interface [CLI](#cli) or by the Klayout graphical user interface [GUI](#gui), as detailed in the subsequent usage sections.

### CLI

The `run_drc.py` script takes a gds file to run DRC rule decks with switches to select subsets of all checks.

```bash
    run_drc.py (--help| -h)
    run_drc.py (--path=<file_path>) [--table=<table_name>]... [--run_dir=<run_dir_path>]
    [--mp=<num_cores>] [--topcell=<topcell_name>] [--run_mode=<run_mode>]
    [--verbose] [--offgrid] [--macro_gen]
```

Example:

```bash
python3 run_drc.py --path=testing/testcases/unit/wg.gds --run_mode=deep --run_dir=wg_drc_results
```

#### Options

- `--help -h`                           Print this help message.

- `--path=<file_path>`                  The input GDS file path.

- `--topcell=<topcell_name>`            Topcell name to use.

- `--table=<table_name>`                Table name to use to run the rule deck.

- `--mp=<num_cores>`                    Run in parallel to speed up the run. [default: 1]

- `--run_dir=<run_dir_path>`            Run directory to save all the results [default: pwd]

- `--run_mode=<run_mode>`               Select allowed modes (flat , deep). [default: flat]

- `--offgrid`                           Turn on OFFGRID checking rules.

- `--verbose`                           Detailed rule execution log for debugging.

- `--macro_gen`                         Generating the full rule deck without run.


#### DRC Outputs

You could find the run results at your run directory if you previously specified it through `--run_dir=<run_dir_path>`, default path of run directory is `drc_run_<date>_<time>` in current directory.

**Folder Structure of run results**

```text
📁 drc_run_<date>_<time>
 ┣ 📜 drc_run_<date>_<time>.log
 ┗ 📜 main.drc
 ┗ 📜 <your_design_name>.lyrdb
 ```

The result is a database file (`<your_design_name>.lyrdb`) contains all violations.
You could view it on your file using: `klayout <input_gds_file> -m <result_db_file> `, or you could view it on your gds file via marker browser option in tools menu using klayout GUI as shown below.

<p align="center">
  <img src="../../images/drc_marker.png" width="80%" >
</p>
<p align="center">
  Fig. 1. Klayout GUI marker browser
</p>

After selecting Marker Browser option, you could load the database file and visualize the DRC violations.

<p align="center">
  <img src="../../images/drc_violation.png" width="80%" >
</p>
<p align="center">
  Fig. 2. Visualization of DRC violation on Klayout-GUI
</p>

### GUI

The GenericPDK also facilitates DRC execution via Klayout menus, integrated with Klayout through the PDK [installation](../../README.md#installation) as depicted below:

<p align="center">
  <img src="../../images/drc_menus.png" width="60%" >
</p>
<p align="center">
  Fig. 3. Run DRC Using Klayout-GUI Menus
</p>

Upon executing the LVS using the `Run Klayout DRC` option, the result database will appear on your layout interface, allowing you to verify the outcome of the run similarly as shown above in Fig. 2.

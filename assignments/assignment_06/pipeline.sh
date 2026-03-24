#!/bin/bash
set -e


bash scripts/01_download_data.sh

bash scripts/flye_2.9.6_manual_build.sh

bash scripts/flye_2.9.6_conda_install.sh

bash scripts/02_run_flye_conda.sh

bash scripts/03_run_flye_module.sh

bash scripts/04_run_flye_local.sh


# the code from Task 7 to print results to STDOUT
tail -n 10 assemblies/assembly_*/*.log

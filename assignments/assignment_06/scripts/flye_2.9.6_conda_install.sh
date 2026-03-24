#!/bin/bash

module load miniforge3


source "$(conda info --base)/etc/profile.d/conda.sh"

#build conda environment called flye-env
#mamba create -y -n flye-env flye=2.9.6
mamba create -y -n flye-env -c bioconda -c conda-forge flye=2.9.6

#activate it
conda activate flye-env

echo "Installed Flye version:"
flye -v

conda env export --no-builds > flye-env.yml


conda deactivate

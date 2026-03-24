#!/bin/bash

# 1. Environment setup
module load miniforge3
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate flye-env

# 2. Output directory
OUT_DIR="./assemblies/assembly_conda"
mkdir -p $OUT_DIR

# 3. Run Flye
flye --nano-hq data/*.fastq.gz --out-dir $OUT_DIR -t 6 --genome-size 150k

# 4. Cleanup and rename
mv $OUT_DIR/assembly.fasta $OUT_DIR/conda_assembly.fasta
mv $OUT_DIR/flye.log $OUT_DIR/conda_flye.log

# Delete all "bloat" files and folders in the output directory
find $OUT_DIR -mindepth 1 ! -name 'conda_assembly.fasta' ! -name 'conda_flye.log' -delete

# 5. Deactivate
conda deactivate
echo "Conda assembly complete."

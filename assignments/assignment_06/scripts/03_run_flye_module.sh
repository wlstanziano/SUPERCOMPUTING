#!/bin/bash
# exit immediately if a command fails
set -e

# 1. Setup: Load the specific Flye module found on Bora
module load Flye/gcc-11.4.1/2.9.6

# 2. Output Directory
OUT_DIR="./assemblies/assembly_module"
mkdir -p $OUT_DIR

# 3. Run Flye
flye --nano-hq data/SRR33939694.fastq.gz --out-dir $OUT_DIR -t 6 --genome-size 150k

# 4. Cleanup and Rename
mv $OUT_DIR/assembly.fasta $OUT_DIR/module_assembly.fasta
mv $OUT_DIR/flye.log $OUT_DIR/module_flye.log

# Delete all other files/folders in this assembly directory
find $OUT_DIR -mindepth 1 ! -name 'module_assembly.fasta' ! -name 'module_flye.log' -delete

echo "Module assembly complete. Results in $OUT_DIR"

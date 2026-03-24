#!/bin/bash
set -e

# 1. Setup
export PATH=$PATH:~/programs/Flye/bin

# 2. Output directory
OUT_DIR="./assemblies/assembly_local"
mkdir -p $OUT_DIR

# 3. Run Flye
flye --nano-hq data/SRR33939694.fastq.gz --out-dir $OUT_DIR -t 6 --genome-size 150k

# 4. Cleanup and rename
mv $OUT_DIR/assembly.fasta $OUT_DIR/local_assembly.fasta
mv $OUT_DIR/flye.log $OUT_DIR/local_flye.log

# Delete bloat
find $OUT_DIR -mindepth 1 ! -name 'local_assembly.fasta' ! -name 'local_flye.log' -delete

echo "Local build assembly complete. Results in $OUT_DIR"

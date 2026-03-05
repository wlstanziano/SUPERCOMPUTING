#!/bin/bash
set -euo pipefail

#loop through every Forward (R1) file in the raw directory
for FWD_FILE in ./data/raw/*_R1_*.subset.fastq.gz
do
    ./scripts/02_run_fastp.sh "$FWD_FILE"
done

echo "All samples have been processed and moved to ./data/trimmed/"

#!/bin/bash

export PATH="$PATH:/sciclone/home/wlstanziano/programs"

BASE_DIR="/sciclone/home/wlstanziano/SUPERCOMPUTING/assignments/assignment_07"
RAW_DIR="$BASE_DIR/data/raw"
CLEAN_DIR="$BASE_DIR/data/clean"
OUTPUT_DIR="$BASE_DIR/output"

# Create directories if they don't exist
mkdir -p "$CLEAN_DIR"
mkdir -p "$OUTPUT_DIR"

echo "Status: Starting Quality Trimming with fastp..."

for R1 in "$RAW_DIR"/*_1.fastq; do
    R2="${R1/_1.fastq/_2.fastq}"

    ID=$(basename "$R1" _1.fastq)

    echo "Processing Sample: $ID"

    fastp \
        --in1 "$R1" \
        --in2 "$R2" \
        --out1 "$CLEAN_DIR/${ID}_1.fastq.gz" \
        --out2 "$CLEAN_DIR/${ID}_2.fastq.gz" \
        --html "$OUTPUT_DIR/${ID}_fastp.html" \
        --json "$OUTPUT_DIR/${ID}_fastp.json" \
        --thread 4
done

echo "Task 3 Complete! Cleaned files are in data/clean/."

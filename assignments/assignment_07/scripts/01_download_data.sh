#!/bin/bash

export PATH="$PATH:/sciclone/home/wlstanziano"
export PATH="$PATH:/sciclone/home/wlstanziano/sratoolkit.3.4.0-ubuntu64/bin"

# paths
BASE_DIR="/sciclone/home/wlstanziano/SUPERCOMPUTING/assignments/assignment_07"
METADATA="$BASE_DIR/data/SraRunTable.csv"
RAW_DIR="$BASE_DIR/data/raw"
DOG_DIR="$BASE_DIR/data/dog_reference"

# download dog genome into the data/dog_reference folder
datasets download genome taxon "canis familiaris" --reference --include genome --filename "$DOG_DIR/dog_genome.zip"

# unzip and name the file, and remove the zip file
unzip -j "$DOG_DIR/dog_genome.zip" "ncbi_dataset/data/*/*.fna" -d "$DOG_DIR/"
mv "$DOG_DIR"/*.fna "$DOG_DIR/dog_reference_genome.fna"
rm "$DOG_DIR/dog_genome.zip"


# reads the 'Run' column and downloads to data/raw/
tail -n +2 "$METADATA" | cut -d ',' -f 1 | while read -r RUN_ID; do
    [ -z "$RUN_ID" ] && continue
    echo "Downloading: $RUN_ID"
    fasterq-dump "$RUN_ID" --split-3 --outdir "$RAW_DIR"
done

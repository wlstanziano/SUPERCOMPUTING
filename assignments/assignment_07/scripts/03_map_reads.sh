#!/bin/bash
#SBATCH --job-name=dog_map_final
#SBATCH --nodes=1
#SBATCH --mem=50G
#SBATCH --cpus-per-task=8
#SBATCH --time=08:00:00
#SBATCH --output=output/map_%j.out
#SBATCH --error=output/map_%j.err

module load samtools

export PATH="$PATH:/sciclone/home/wlstanziano/programs:/sciclone/home/wlstanziano/programs/bbmap"

# paths
BASE_DIR="/sciclone/home/wlstanziano/SUPERCOMPUTING/assignments/assignment_07"
GENOME="$BASE_DIR/data/dog_reference/dog_reference_genome.fna"
MAPPED_DIR="$BASE_DIR/data"

# loop through clean reads
for R1 in "$BASE_DIR/data/clean"/*_1.fastq.gz; do
    R2="${R1/_1.fastq.gz/_2.fastq.gz}"
    ID=$(basename "$R1" _1.fastq.gz)
    BAM_OUT="$BASE_DIR/data/mapped/${ID}_mapped_sorted.bam"

    echo "Processing $ID: Mapping and Extracting..."

    bbmap.sh in1="$R1" in2="$R2" ref="$GENOME" minid=0.95 -Xmx40g threads=8 out=stdout.sam | \
    samtools view -b -F 4 | \
    samtools sort -o "$BAM_OUT"

    # Index the final file
    samtools index "$BAM_OUT"
done

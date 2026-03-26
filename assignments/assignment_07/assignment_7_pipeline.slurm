#!/bin/bash
#SBATCH --job-name=assignment_7_full_pipeline
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=50G
#SBATCH --time=12:00:00
#SBATCH --output=/sciclone/home/wlstanziano/SUPERCOMPUTING/assignments/assignment_07/output/pipeline_%j.out
#SBATCH --error=/sciclone/home/wlstanziano/SUPERCOMPUTING/assignments/assignment_07/output/pipeline_%j.err

module load samtools
export PATH="$PATH:/sciclone/home/wlstanziano/programs"
export PATH="$PATH:/sciclone/home/wlstanziano/programs/bbmap"
export PATH="$PATH:/sciclone/home/wlstanziano/sratoolkit.3.4.0-ubuntu64/bin"

# move to the project directory to ensure relative paths in scripts work
cd /sciclone/home/wlstanziano/SUPERCOMPUTING/assignments/assignment_07

echo "Master Pipeline Started at: $(date)"

# run the three scripts in order

echo "Step 1: Downloading Data..."
bash scripts/01_download_data.sh

echo "Step 2: Cleaning Reads with fastp..."
bash scripts/02_clean_reads.sh

echo "Step 3: Mapping and Extracting Dog-Specific Reads..."
bash scripts/03_map_reads.sh

echo "Master Pipeline Finished at: $(date)"

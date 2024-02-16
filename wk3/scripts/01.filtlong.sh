#!/bin/bash
#SBATCH --job-name=download_sra
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=amy.fitzpatrick@ucd.ie
#SBATCH --time=0-4:00
#SBATCH --cpus-per-task=5
#SBATCH --error=/home/people/<username>/scratch/training/logs/fetch_sra_err_%j.log
#SBATCH --output=/home/people/<username>/scratch/training/logs/fetch_sra_%j.log

# testing limits for worst reads on length and quality profiles
bins=(90 80 70)
OUTPUT_DIR="/home/people/<username>/scratch/training/wk3/data/filtered"

for bin in "${bins[@]}"
do
    # Create a directory for each SRA accession
    mkdir -p "$OUTPUT_DIR/$bins"
    
    filtlong --min_length 1000 \
    --keep_percent $bin \
    input.fastq | gzip > output.fastq
    
    echo "Filtered the reads with $bin successfully"
done
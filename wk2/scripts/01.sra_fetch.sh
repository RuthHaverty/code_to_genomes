#!/bin/bash
#SBATCH --job-name=download_sra
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=amy.fitzpatrick@ucd.ie
#SBATCH --time=0-4:00
#SBATCH --cpus-per-task=10
#SBATCH --error=/home/people/<username>/scratch/training/logs/fetch_sra_err_%j.log
#SBATCH --output=/home/people/<username>/scratch/training/logs/fetch_sra_%j.log

# Load anaconda module
module load anaconda/3.5.2

# Activate your conda environment for SRA Toolkit
conda activate /home/people/<username>/scratch/tools/sra_tools

# Define the list of SRA accessions
SRAs=("X" "Y" "Z")

# Specify the output directory for fastq-dump
OUTPUT_DIR="/path/to/your/output/directory"

# Loop through the SRA accessions, download, and convert to fastq
for SRA in "${SRAs[@]}"
do
    # Create a directory for each SRA accession
    mkdir -p "$OUTPUT_DIR/$SRA"
    
    # Change to the directory for the specific SRA accession
    cd "$OUTPUT_DIR/$SRA"
    
    # Download the SRA file using prefetch
    prefetch "$SRA"
    
    # Convert the SRA file to fastq format using fastq-dump
    fasterq-dump --split-files "$SRA" -O "$OUTPUT_DIR/$SRA"
    
    echo "Downloaded $SRA successfully"
done
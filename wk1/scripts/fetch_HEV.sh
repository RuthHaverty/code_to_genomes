#!/bin/bash
#SBATCH --job-name=HEV3_fetch # Job name
#SBATCH --mail-type END,FAIL
#SBATCH --mail-user  # Where to send mail
#SBATCH -t 0-4:00  # Time for the task to complete
#SBATCH --error= # Standard output and error log
#SBATCH --output=
#SBATCH --cpus-per-task=5

module load anaconda/3.5.2
conda activate /your_path/entrez-direct

# Specify the GenBank accession number
accession_number="NC_001826.2"  # Replace with the actual accession number

# Specify the output file name for the FASTA file
output_file=""
outdir=""

# Fetch the nucleotide sequence for the provided accession number
response=$(efetch -db nuccore -id "$accession_number" -format fasta -mode text 2>/dev/null)
#!/bin/bash
#SBATCH --job-name=HEV3_fetch # Job name
#SBATCH --mail-type END,FAIL
#SBATCH --mail-user  # Where to send mail
#SBATCH -t 0-4:00  # Time for the task to complete
#SBATCH --error= # Standard output and error log
#SBATCH --output=
#SBATCH --cpus-per-task=5

# Modify this script to fetch the nucleotide sequence for the HEV3 strain from GenBank
module load anaconda/3.5.2

# Set up your conda environment for entrez!
# https://bioconda.github.io/recipes/entrez-direct/README.html
conda activate /your_path/entrez-direct

# Specify the GenBank accession number that you want to download
# You will want to download at least 5 sequences for the next exercise, so make sure they are different
accession_number="your_accession_number"  # Replace with the actual accession number

# Specify the output file name for the FASTA file
# Remember to include the .fasta extension
# Output files should be stored in the training/wk1/data folder
output_file="output.fasta"

# Specify the output directory
outdir="your_output_directory"

# Fetch the nucleotide sequence for the provided accession number
# Try to modify this command to download protein sequences instead of nucleotide sequences
response=$(efetch -db nuccore -id "$accession_number" -format fasta -mode text 2>/dev/null)

# Redirect the response to the output file
echo "$response" > "$outdir/$output_file"

conda deactivate
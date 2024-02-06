#!/bin/bash
#SBATCH --job-name=DiamondAlignment # Job name
#SBATCH --mail-type END,FAIL
#SBATCH --mail-user  # Where to send mail
#SBATCH -t 0-4:00  # Time for the task to complete
#SBATCH --error= # Standard output and error log
#SBATCH --output=
#SBATCH --cpus-per-task=5

# Load anaconda module

# Activate your conda environment for Diamond

# Input your nucleotide or protein query file in FASTA format
query_file="your_protein_query.fasta"

# Diamond database path (replace with the actual path to your database)
database_path="path/to/your/database.dmnd"

# Output file for the alignment results
output_file="output_alignment"

# Run Diamond for nucleotide sequence alignment
$diamond_path blastn \
  --query $query_file \
  --db $database_path \
  --out $output_file \
  --outfmt 6 \
  --threads 5

conda deactivate
module unload anaconda/3.5.2
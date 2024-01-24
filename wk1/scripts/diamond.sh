#!/bin/bash
#SBATCH --job-name=DiamondAlignment # Job name
#SBATCH --mail-type END,FAIL
#SBATCH --mail-user  # Where to send mail
#SBATCH -t 0-4:00  # Time for the task to complete
#SBATCH --error= # Standard output and error log
#SBATCH --output=
#SBATCH --cpus-per-task=5

# Path to the Diamond executable
diamond_path="diamond"

# Input protein query file in FASTA format
query_file="your_protein_query.fasta"

# Diamond database path (replace with the actual path to your database)
database_path="path/to/your/database.dmnd"

# Output file for the alignment results
output_file="output_alignment"

# Run Diamond for protein sequence alignment
$diamond_path blastp \
  --query $query_file \
  --db $database_path \
  --out $output_file \
  --outfmt 6 \
  --threads 5

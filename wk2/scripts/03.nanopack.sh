#!/bin/bash
#SBATCH --job-name=<job-name>
#SBATCH --output=slurm_%j.out
#SBATCH --error=slurm_%j.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --time=24:00:00
#SBATCH --mem=4G

# Load anaconda module
module load anaconda/3.5.2
conda activate /home/people/<username>/tools/nanopack_env

# Run NanoPlot
NanoPlot --fastq /home/people/<username>/scratch/training/wk2/data/<fastq-file>.fastq --outdir /home/people/<username>/scratch/training/wk2/data/<output-dir>

# Run NanoComp
# Replace <fastq-file1>, <fastq-file2>, etc. with your actual fastq files
NanoComp --fastq /home/people/<username>/scratch/training/wk2/data/<fastq-file1>.fastq /home/people/<username>/scratch/training/wk2/data/<fastq-file2>.fastq --outdir /home/people/<username>/scratch/training/wk2/data/<output-dir>

# Run NanoQC
NanoQC /home/people/<username>/scratch/training/wk2/data/<fastq-file>.fastq --outdir /home/people/<username>/scratch/training/wk2/data/<output-dir>

# Run Chopper and then NanoPlot on the output
# Replace <min-length>, <max-length>, and <max-errors> with your actual values
NanoPlot --fastq /home/people/<username>/scratch/training/wk2/data/<output-dir>/chopped.fastq --outdir /home/people/<username>/scratch/training/wk2/data/<output-dir>

# Deactivate the conda environment
conda deactivate
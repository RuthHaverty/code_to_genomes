#!/bin/bash
#BATCH --job-name=01_AHF_HEV3_fetch # Job name
#SBATCH --mail-type END,FAIL
#SBATCH --mail-user amy.fitzpatrick@ucd.ie  # Where to send mail
#SBATCH -t 0-01:00  # Time for the task to complete
#SBATCH --error=/home/people/fitzpatria/training/wk2/logs/01_HEV3_fetch_err_%j.log # Standard output and error log
#SBATCH --output=/home/people/fitzpatria/training/wk2/logs/01_HEV3_fetch_%j.log
#SBATCH --cpus-per-task=1

# Modify this script to fetch the nucleotide sequence for the HEV3 strain from GenBank

echo "Fetching HEV3 sequence from GenBank"
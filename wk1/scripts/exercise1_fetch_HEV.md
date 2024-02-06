# Fetching Nucleotide Sequences from GenBank

This exercise involves modifying a script to fetch the nucleotide sequence for the HEV3 strain from GenBank. You should write a SLURM script to fetch the sequence and save it to a file. The script should be saved in the training/wk1/scripts folder. The script should be named fetch_HEV3.sh.

## SLURM Setup

SLURM (Simple Linux Utility for Resource Management) is a job scheduler that allocates compute resources for jobs. In this exercise, you will write a SLURM script to fetch the sequence and save it to a file on the cluster.

Here is a basic setup for a SLURM script:

```bash
#!/bin/bash
#SBATCH --job-name=JobName  # Job name
#SBATCH --mail-type=END,FAIL  # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=email@example.com  # Where to send mail	
#SBATCH --ntasks=1  # Run on a single CPU
#SBATCH --mem=1gb  # Job memory request
#SBATCH --time=00:05:00  # Time limit hrs:min:sec
#SBATCH --output=joblog_%j.txt  # Standard output and error log
```

Replace JobName with the name of your job, email@example.com with your email, and adjust --ntasks, --mem, and --time as needed for your job. The --output option specifies the name of the output log file. The %j is replaced by the job ID.

After the SLURM directives, you can write the commands for your job. 

## Preparing the Script

We will use Entrez-direct to fetch the sequence from GenBank but we should install it before running our script.

In the command line follow these steps: First, load the Anaconda module so that you can create and activate a conda environment for Entrez-direct.

```bash
module load anaconda/3.5.2
```

Next, set up your conda environment for Entrez. You can find more information about this here["https://bioconda.github.io/recipes/entrez-direct/README.html"].

```bash
conda create --prefix /your_path/entrez-direct -c bioconda entrez-direct
conda activate /your_path/entrez-direct
```

## Creating the script
Now that you have the Entrez-direct environment set up, you can write the script to fetch the sequence. The script should be saved in the training/wk1/scripts folder. The script should be named fetch_HEV3.sh.

You can create a script on the command line using the command `touch fetch_HEV3.sh`. This will create an empty file named fetch_HEV3.sh. You can then open the file in a text editor such as nano or vim to write the script. If you use vi or vim, you can open the file with the command `vi fetch_HEV3.sh` or `vim fetch_HEV3.sh`. If you use nano, you can open the file with the command `nano fetch_HEV3.sh`.

To edit a file in vi or vim, press the "i" key to enter insert mode. You can then type your script. When you are finished, press the "esc" key to exit insert mode. Then type ":wq" and press "enter" to save and exit the file. To edit a file in nano, simply type your script. When you are finished, press "ctrl" + "x" to exit the file. You will be prompted to save the file. Press "y" to save the file.

Alternatively, you can use create a new file by taking advantage of the remote explorer extension in VSCode. You can create a new file by right-clicking on the scripts folder and selecting "New File". You can then name the file fetch_HEV3.sh and write the script. You can directly edit the script in the VSCode editor.

##  Writing the Script
For the script to function it must have the following sections 

* SLURM setup
* Preparing the modules, libraries, conda environment, etc.
* Fetching the sequence
* Saving the sequence to a file
* Unloading the modules, libraries, conda environment, etc.

We have gone through the first two sections. Now we will write the script to fetch the sequence and save it to a file.

### Fetching the Sequence
Specify the GenBank["https://www.ncbi.nlm.nih.gov/genbank/"] accession number that you want to download. Search using key terms in the nucleotide serach box. GenBank accession numbers usually beign with two letters are followed by a number of digits, typically six. 

You will want to download at least 5 sequences for the next exercise, so make sure they are different. Replace "your_accession_number" with the actual accession number.

```bash
accession_number="your_accession_number"
```

Specify the output file name for the FASTA file. Remember to include the .fasta extension. Output files should be stored in the training/wk1/data folder.

```bash
output_file="output.fasta"
```

Specify the output directory:

```bash
outdir="your_output_directory"
```
Fetch the nucleotide sequence for the provided accession number and redirect the response to the output file. Try to modify this command to download protein sequences instead of nucleotide sequences

```bash
response=$(efetch -db nuccore -id "$accession_number" -format fasta -mode text 2>/dev/null)
echo "$response" > "$outdir/$output_file"
```

Please replace "/your_path/entrez-direct", "your_accession_number", and "your_output_directory" with your actual path, accession number, and output directory respectively.

## Running the script
If you are satisifed with your script, that it contains all the necessary elements and no typos, you can run it using the command `sbatch fetch_HEV3.sh`. This will submit the script to the cluster to be run. You can check the status of your job using the command `squeue -u your_username`. Replace "your_username" with your actual username. You can check the output of your job using the command `cat joblog_jobid.txt`. Replace "jobid" with the actual job ID. You can also check the output of your job using the command `less joblog_jobid.txt`. Replace "jobid" with the actual job ID. You can exit the output by pressing "q".
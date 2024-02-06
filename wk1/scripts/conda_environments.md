# Conda Package and Environment Management System

Conda is an open-source package management and environment management system for installing and managing software packages and dependencies across various computing platforms. It simplifies the process of creating, sharing, and managing software environments for different projects and applications.

We can use conda to create a new environment for specific tools that we want to use, or for specific projects, where we want to install a number of packages. This environment will contain all the necessary libraries and tools we need to complete our project. To use conda, we first need to load the Anaconda module.

To load modules, we use the module load command followed by the name of the module we want to load.

```bash
module load anaconda/3.5.2
```

To see a list of available modules, we can use the module avail command.

```bash
module avail 
```
To exit module avail, you can use ctrl +c

To see a list of modules that are currently loaded, we can use the module list command.

```bash
module list
```

## Creating a Tools Directory
It is good practice to store all of your tools (packages, libraries, etc.) in a separate folder in your home directory. Create a new folder named 'tools' in your home directory on the UCD Sonic cluster.

```bash
cd ~
mkdir tools
cd tools
```

## Creating a Conda Environment for Diamond
Now let's create a new Conda environment for the tool Diamond. DIAMOND (DIAMOND Is A Metagenomic Omic pipeline for NGS Data) is a bioinformatics tool designed for rapid and sensitive sequence alignment and similarity searches, commonly used for comparing protein or nucleotide sequences against large databases. It employs efficient algorithms and heuristics, providing a faster alternative to traditional tools like BLAST for analyzing large-scale genomic and metagenomic datasets.

The first time you use conda, you need to run conda init bash to initialize your shell. This will make sure that conda's base environment is activated every time you open a new terminal window.

```bash
conda init bash
conda env list
conda create --prefix /home/people/<username>/tools/diamond_env
conda activate /home/people/<username>/tools/diamond_env
conda install -c bioconda diamond
diamond help
conda deactivate
```

## Using Diamond to Create a Database
Now we will use diamond to make a database from a fasta file that I have provided for you. Data analysis should always be performed on the scratch folder of the HPC.

```bash
cd /scratch/<username>
mkdir -p training/wk1/data
cd training/wk1/data
cp /scratch/fitzpatria_sh/wk1/data/HEV3.fasta .
diamond makedb --in HEV3.fasta -d HEV3
ls
```
Congratulations! You have successfully created a diamond database from a fasta file.

Please replace <username> with your actual username in the bash commands.

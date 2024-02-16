# Genome Assembly of viral genomes from long reads

Genome assembly is the process of taking a large number of DNA sequences and putting them back together to create a representation of the original genomes from which the DNA/RNA was taken. The genome of an organism is the complete set of RNA or DNA that contains all of the information needed to build and maintain that organism. The process of genome assembly has become a critical step in the analysis of the DNA sequence of an organism. The assembly process is computationally intensive and is usually performed on a high-performance computing cluster.

Long-read sequencing technologies, such as PacBio and Oxford Nanopore, have made it possible to sequence complete viral genomes in a single read. This has made it possible to assemble complete viral genomes from a single sequencing run. The long reads produced by these technologies can span the entire length of a viral genome, making it possible to assemble complete viral genomes without the need for additional sequencing runs.

### How does it work?
The process for assembling a genome depends on a few factors: 

* The type of sequencing technology used
* The length of the reads produced by the sequencing technology
* The complexity of the genome being assembled
* Whether the genome being assembled is a single genome or a metagenome
* Whether the genome being assembled is known or unknown. The process of conducting genome assembly without a reference genome is called *de novo* assembly.

In general, the process of *de novo* genome assembly involves the following steps:

1. **Read error correction**: Long-read sequencing technologies are prone to errors, and the first step in the assembly process is to correct these errors. This is usually done by comparing the long reads to each other and identifying and correcting errors.
2. **Read alignment**: The corrected long reads are then aligned to each other to identify overlapping regions. These overlapping regions are used to construct the genome.
3. **Genome construction**: The overlapping regions identified in the previous step are used to construct the genome. This is done by identifying the longest overlapping regions and using them to build the genome.
4. **Genome polishing**: The final step in the assembly process is to polish the assembled genome. This involves using additional sequencing data to correct any remaining errors in the assembled genome.
5. **Genome annotation**: Once the genome has been assembled and polished, it can be annotated to identify genes, regulatory elements, and other features.

Different tools use different algorithms to perform these steps, and the choice of tool depends on the type of sequencing data being used and the complexity of the genome being assembled. In particular, step 3, the algorithims to perform genome construction can vary widely across tools. It is important to always read the documentation for the tool you are using to understand how it works and what parameters are available.

### Genome assembly tools

We will apply two different tools for genome assembly. One tool has been developed by the Maryland Bioinformatics Lab is called [Canu](https://github.com/marbl/canu). The other tool is called [viralFlye](https://github.com/Dmitry-Antipov/viralFlye) and has been developed by Dmitry Antipov. Canu is suited to assemble long reads from isolates sequenced on PacBio and Oxford Nanopore. ViralFlye is a tool specifically designed for viral assembly from long reads of metagenomic samples. 

Depending on the type of data you have, you may want to use one tool over the other. For example, if you are working with a metagenomic sample, you may want to use viralFlye. If you are working with a single isolate, you may want to use Canu.

# Exercise 

## Task 1: Decide which genome assembly tool to use
Read the documentation for Canu and viralFlye and decide which tool you would use for the datasets you have downloaded in week two. Document your decision and the reasons for it.

## Task 2: Download and install the genome assembly tool 
Download and install the genome assembly tool you have chosen. Document the installation process and any issues you encountered.


### Canu installation
Canu is available as a precompiled binary for Linux and Mac OS X. You can download the latest release from the [Canu GitHub releases page](https://github.com/marbl/canu/releases). Remember that tools should be installed in the `tools` directory of your home directory.

```bash
cd ~/tools
curl -L https://github.com/marbl/canu/releases/download/v2.2/canu-2.2.Linux-amd64.tar.xz --output canu-2.2.Linux.tar.xz 
tar -xJf canu-2.2.Linux.tar.xz
# Add the path to the canu binary to your PATH in your .bashrc_profile file
vi ~/.bashrc_profile
# Press I to enter insert mode and add the following line
export PATH=$PATH:/home/people/fitzpatria/tools/canu-2.2/bin
# Press ESC to exit insert mode
ESC
# Type :wq to save and exit the file
:wq
```

Now you can run `canu` from the command line.

### ViralFlye installation
If you are using ViralFlye we first will need to install metaFlye. The installation of metaFlye is as follows:

```bash
module load anaconda/3.5.2
conda create --prefix /home/people/<username>/tools/flye -c bioconda flye
conda activate /home/people/<username>/tools/flye
```

The installation for viralFlye is as follows: 
    
```bash
git clone https://github.com/Dmitry-Antipov/viralFlye
cd viralFlye
```

We need to edit the install.sh file that will create the conda environment for viralFlye. The install.sh file is located in the viralFlye directory. You can edit using the `vi` editor, or within VSCode. Open install.sh and copy and paste the following code. Edit the path so that it directs to the tools directory in your home directory.

```bash
#!/bin/bash

# Define the installation directory
INSTALL_DIR="/home/people/<username>/tools/viralFlye"

# Create the Conda environment with the specified directory
conda create -p "$INSTALL_DIR" -c bioconda -c conda-forge -c mikeraiko "python>=3.6" prodigal viralverify vcflib seqtk minced minimap2 biopython pysam tabix samtools freebayes bcftools numpy scipy blast bwa viralcomplete

# Activate the Conda environment
source activate "$INSTALL_DIR"

# Additional commands if needed
# CONDA_BASE=$(conda info --base)
# source "$CONDA_BASE/etc/profile.d/conda.sh"
# git clone https://github.com/Dmitry-Antipov/viralFlye
# export PATH=$PATH:$(pwd)/viralFlye
# export PATH=$PATH:$(pwd)
# export PATH=$PATH:$(pwd)/viralComplete
# chmod +x viralFlye.py
```

Now you can run the install.sh file to install the conda environment and the viralFlye tool. 

```bash
# This will start to install the conda environment 
./install.sh
# Download the Pfam database
wget http://ftp.ebi.ac.uk/pub/databases/Pfam/releases/Pfam34.0/Pfam-A.hmm.gz
conda activate viralFlye
./viralFlye.py
```

Now that ViralFlye is installed, you can run the `viralFlye.py` script from the command line. In order to make it glolbally available, you can add the path to the viralFlye directory to your PATH in your .bashrc_profile file. 

```bash
vi ~/.bashrc_profile
# Press I to enter insert mode and add the following line
export PATH=$PATH:/home/people/<username>/tools/viralFlye
# Press ESC to exit insert mode
ESC
# Type :wq to save and exit the file
:wq
```

## Task 3: Assemble the viral genomes
Use the genome assembly tool you have installed to assemble the viral genomes from the long reads you downloaded in week two. Document the assembly process and any issues you encountered.

## Assembly with Canu
Review the documentation for [Canu](https://canu.readthedocs.io/en/latest/tutorial.html) and run the assembly process with parameters that are suitable for the data you have. To see all the parameters avaialble for the assembly process, you can run `canu -h`.

An example canu command is as follows for the frog-like virus would be:

```bash
canu -p SRR15907664 -d /home/people/<username>/scratch/training/data/assembly/SRR15907664 -nanopore-raw /home/people/<username>/scratch/training/data/cleaned_reads/SRR15907664.fastq
```

An example process for the wastewater sample would be to first create draft assemblies for each sample with flye and then polish the assemblies with viralFlye. . 

The process to create a draft assembly with flye is as follows:

```bash
module load anaconda/3.5.2
conda activate /home/people/<username>/tools/flye
flye --nano-raw /home/people/<username>/scratch/training/data/cleaned_reads/SRR20000434.fastq --out-dir /home/people/<username>/scratch/training/data/assembly/flye/SRR20000434 --threads 4 --meta 
```

Once flye has completed, you can run viralFlye to polish the assembly. 

```bash
module load anaconda/3.5.2
conda activate /home/people/<username>/tolsols/viralFlye
viralFlye="/home/people/fitzpatria/tools/viralFlye/viralFlye.py"

$viralFlye --dir "/home/people/<username>/scratch/training/data/assembly/flye/SRR20000434" --hmm "path_to_Pfam-A.hmm.gz" --reads "home/people/<username>/scratch/training/data/cleaned_reads/SRR20000434.fastq" --outdir "home/people/<username>/scratch/training/data/assembly/viralFlye/SRR20000434"

conda deactivate
module unload anaconda/3.5.2
```


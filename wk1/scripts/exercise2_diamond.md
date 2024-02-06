# Diamond Sequence Alignment

This exercise involves using Diamond to align a sequence against a database. You should use the fasta file I have provided for you to create your database. You should use the sequecnes from exercise 1 as your input queries.

## Setup

First, load the Anaconda module:

```bash
module load anaconda/3.5.2
```

Next, create and activate your conda environment for Diamond. Remember tools should be installed in your /home/tools folder. Replace "/your_path/diamond" with the path to your conda environment:

```bash
conda create --prefix /your_path/diamond -c bioconda diamond
conda activate /your_path/diamond
```

## Creating the Database
Before you can run the alignment, you need to create a Diamond database from a FASTA file. Replace "your_database.fasta" with the path to your FASTA file and "your_database.dmnd" with the desired path for the Diamond database. You might need to create a new directory for the database if it does not exist called 'References'. You can do this by running the following command:

```bash
mkdir /home/people/<username>/training/wk1/references
```

Then you can create the database:

```bash
diamond makedb --in /home/people/<username>/scratch/training/wk1/data/your_database.fasta -d /home/people/<username>/scratch/training/wk1/references/your_database.dmnd
```

## Running the Alignment
Make sure that the files you downloaded in script one are stored in a folder on the scratch. Replace "your_nucleotide_query.fasta" with the path to your query file. You have five queries, so think about different ways to query multiple sequences. You could use a for loop to iterate through the files, or you could use a single file with multiple sequences in it. 

To run a for loop, you can use the following command. You will need to edit it and replace the # with the diamond commands. 

```bash
for file in /home/people/<username>/scratch/training/wk1/data/*.fasta; do
    echo $file
    # do something with $file
done
```
Alternatively, you can combine all of the sequences you downloaded in exercise one into a single file. You can do this by running the following command:

```bash
cat /home/people/<username>/scratch/training/wk1/data/*.fasta > /home/people/<username>/scratch/training/wk1/data/all_sequences.fasta
```

You should define the path to your query file:
```bash
query_file="/home/people/<username>/scratch/training/wk1/data/your_nucleotide_query.fasta"
```

Specify the path to your Diamond database:

```bash
database_path="path/to/your/database.dmnd"
```

Specify the output file for the alignment results:

```bash
output_file="output_alignment"
```
Run Diamond for nucleotide sequence alignment:
    
```bash
    diamond blastn \
        --query $query_file \
        --db $database_path \
        --out $output_file \
        --outfmt 6 \
        --threads 5
```
Please replace /your_path/diamond, your_database.fasta, your_database.dmnd, your_protein_query.fasta, and path/to/your/database.dmnd with your actual path to the conda environment, path to your database FASTA file, path to your Diamond database, path to your query file, and path to your Diamond database respectively.

## Take it to the next level with a few modifications

### Fetch protein sequences
Now, modify the script to run Diamond for protein sequence alignment. Replace "blastn" with "blastp":
    
```bash
        diamond blastp \
            --query $query_file \
            --db $database_path \
            --out $output_file \
            --outfmt 6 \
            --threads 5
```

## Implementing a for loop
Try to run a for loop to iterate through the files, using the example provided earluier. You will need to edit it and replace the # with the diamond commands. 

## Interpret the results
Finally, interpret the results. What do you see? What do you think the results mean? What tools can you use to visualise the results? 

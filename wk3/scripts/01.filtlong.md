# Quality Control with Filtlong
[Filtlong](https://github.com/rrwick/Filtlong) is a tool for filtering long reads by quality. It can take a set of long reads and produce a smaller, better subset. It uses both read length (longer is better) and read identity (higher is better) when choosing which reads pass the filter. It is very useful if you are working with hybrid sequencing datasets i.e. when you have both long and short reads available from the same library. 

## Installation
Unfortunately, Filtlong is not available on conda. You can install it using git and make. The `make` command will compile the source code and install the binary in the directory that we specify. Make indicates that the source code is written in C or C++.

Navigate to the directory (/home/people/<username>) where you want to install Filtlong and run the following commands:

```bash
git clone https://github.com/rrwick/Filtlong.git
cd Filtlong
make -j
bin/filtlong -h
```

The last command should print the help message for Filtlong. If it does, then the installation was successful. As we will use Filtlong regularly, it is a good idea to add the `bin` directory to your `PATH` environment variable. This will allow you to run `filtlong` from any directory without specifying the full path to the binary.

To do this we will edit our `~/.bash_profile` file. Open the file in a text editor and add the following line at the end:

```bash
# User specific environment and startup programs
export PATH="/home/people/<username>/tools/Filtlong/bin"
```

To ensure that the changes take effect, run the following command:

```bash
source ~/.bash_profile
```

To test whether or not this is true, run the following command outside of the tools directory:

```bash
filtlong -h
```
## Usage
We do not have an external reference. You will need to define what the fitlering paramters you are applying are. For example, you may want to filter out reads that are less than 1000bp long and have an identity of less than 90%. You can do this using the following command:

```bash
filtlong --min_length 1000 --keep_percent 90 --target_bases 500000000 input.fastq | gzip > output.fastq
```

This command will take the input.fastq file, filter out reads that are less than 1000bp long and have an identity of less than 90%, and then output the first 500,000,000 bases to the output.fastq file. The `| gzip` part of the command compresses the output.fastq file using the gzip algorithm. This is useful as the output file can be very large.

## Exercise
1. Install Filtlong on your computer.
2. Run the example command on the provided input.fastq file.
3. Run the example command on the provided input.fastq file without the `| gzip` part. How much larger is the output file?
4. Run the example command on the provided input.fastq file with the `--target_bases` parameter set to 1000000000. How much larger is the output file?
5.
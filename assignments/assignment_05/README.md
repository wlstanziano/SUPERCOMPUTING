# William Stanziano
# March 5, 2026
# Assignment 5



#1
mkdir data
cd data
mkdir raw trimmed
cd ..
mkdir log
touch pipeline.sh
mkdir scripts
touch 01_download_data.sh 02_run_fastp.sh
mv 01_download_data.sh 02_run_fastp.sh scripts


#2
nano scripts/01_download_data.sh

#added the following:

#!/bin/bash
set -ueo pipefail
#gets and unpacks tarball file
wget https://gzahn.github.io/data/fastq_examples.tar
tar -xf fastq_examples.tar
#move the files into ./data/raw
mv *fastq.gz ./data/raw/
#cleans up tarball file
rm fastq_examples.tar


#3
#download fastp
cd ~/programs
wget http://opengene.org/fastp/fastp
chmod a+x ./fastp

#add fastp to $PATH
nano ~/.bashrc
# I changed my export path for seqtk to be just for my programs folder as a whole:
# so
# export PATH="$PATH:$HOME/programs/seqtk"
# was changed to:
export PATH="$PATH:$HOME/programs"

#version check
./fastp --version
#output: fastp 1.1.0

#documentation
fastp --help

#test - successfull
fastp \
  -i ./data/raw/6083_001_S1_R1_001.subset.fastq.gz \
  -I ./data/raw/6083_001_S1_R2_001.subset.fastq.gz \
  -o ./data/trimmed/fwd_out.fastq.gz \
  -O ./data/trimmed/rev_out.fastq.gz \
  --trim_front1 8 --trim_tail1 20 \
  --html ./log/report.html


#4
nano scripts/02_run_fastp.sh
#(write script)
chmod +x scripts/02_run_fastp.sh
#run
./scripts/02_run_fastp.sh ./data/raw/6083_001_S1_R1_001.subset.fastq.gz


#5
nano pipeline.sh
#(write script)
chmod +x pipeline.sh 
#run:
./pipeline.sh


#6
#delete the data files
rm -rf ./data/raw/* ./data/trimmed/* ./log/*
#redownload data
./scripts/01_download_data.sh 
#run pipeline again
./pipeline.sh



#7 Reflection
From this assignment I've gotten "chmod +..." much more hammered into my head than before, and what the little letters after the + mean - which is good.
I can also just generally feel myself getting more and more comfortable navigating the terminal, and getting to different files and directories with much less conscious thought than it originally required of me.
We split this up into two scripts -- one for processing one sample, and the other for looping this over the files
and knowing where they are stored and where to add the cleaned files -- so that we can make sure one part works
before doing the other one. And when we need to debug it's much better to be able to localize where the problem
might be to a smaller amount of code.

# .gitignore
# added this to my .gitignore file:
# ignore data directories
data/

# ignore tar stuff              
*.gz
*.tar


#!/bin/bash

set -ueo pipefail

#gets and unpacks tarball file
wget https://gzahn.github.io/data/fastq_examples.tar
tar -xf fastq_examples.tar

#move the files into ./data/raw
mv *fastq.gz ./data/raw/

#cleans up tarball file
rm fastq_examples.tar

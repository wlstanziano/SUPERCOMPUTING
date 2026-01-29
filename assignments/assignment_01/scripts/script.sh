#!/bin/bash

# Example script using relative paths
echo "Starting script" > ../logs/logfile.log
cat ../data/raw/example.txt > ../data/clean/example.txt
echo "Script finished" >> ../logs/logfile.log

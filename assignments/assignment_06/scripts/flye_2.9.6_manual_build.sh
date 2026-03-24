#!/bin/bash

# move into programs directory
cd ~/programs

# clone the repository
git clone https://github.com/mikolmogorov/Flye
cd Flye
make

echo "Manual build complete. Flye is ready at: ~/programs/Flye/bin/flye"

# William Stanziano
# March 23, 2026
# Assignment 6



#2
#make script
$touch scripts/01_download_data.sh
#add code
#!/bin/bash
wget -O data/SRR33939694.fastq.gz "https://zenodo.org/records/15730819/files/SRR33939694.fastq.gz?download=1"



#3
# make /scripts/flye_2.9.6_manual_build.sh
# put in the code
# test that it works:
which flye
bash scripts/flye_2.9.6_manual_build.sh 


#4
# make the script
nano scripts/flye_2.9.6_conda_install.sh
# write the code
# test to make sure it works:
bash scripts/flye_2.9.6_conda_install.sh


#5
# flye documentation
flye -h
# flye command design:
flye --nano-hq data/*.fastq.gz --out-dir ./assemblies/assembly_conda -t 6 --genome-size 150k


#6
#6a: Conda environment
# make script and run it with:
bash scripts/02_run_flye_conda.sh

#6b
# make script
nano scripts/03_run_flye_module.sh
#test
bash 03_run_flye_module.sh

#6c
# make script
nano scripts/04_run_flye_local.sh
# run
bash 04_run_flye_local.sh


#7
tail -n 10 assemblies/assembly_*/*.log
# The outputs are the same for all three methods we used - so the assembly was reproducible
# across all three environments. This is good news.


#8
nano pipeline.sh
# add in code


#9 Reflection
# Challenges Overcome
One primary challenge was the initial data download. Using wget without specific flags resulted in a
filename ending in a query string (?download=1), which prevented my scripts from finding the fastq files.
I resolved this by adding the -O flag to explicitly name the output file.

Another issue involved lockfile errors when using Mamba on the shared cluster. I addressed this by ensuring
the environment was created in my local home directory to avoid permission conflicts with the system-wide
package cache.

Method Comparison
The Conda method provided the best environment isolation but required more setup time. The system module
was the fastest to implement but is less portable since it depends on the cluster administrators. The local
build method required manual compilation which was more complex to set up but provided the most direct control
over the software binary. I will probably use the conda method in the future - it just makes more sense to me.

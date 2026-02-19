William Stanziano
Thursday, Feb. 12, 2026
Assignment #2

# making data file in assignment_02 and checking contents of the assignment file in general
[26 wlstanziano@bora ~/SUPERCOMPUTING/assignments ]$cd assignment_02
[27 wlstanziano@bora ~/SUPERCOMPUTING/assignments/assignment_02 ]$mkdir data
[28 wlstanziano@bora ~/SUPERCOMPUTING/assignments/assignment_02 ]$ls -l directory_name
ls: cannot access 'directory_name': No such file or directory
[29 wlstanziano@bora ~/SUPERCOMPUTING/assignments/assignment_02 ]$ls -l
total 0
drwxr-x---. 2 wlstanziano gzdata440 112 Feb 11 13:32 data
-rw-r-----. 1 wlstanziano gzdata440   0 Feb 10 10:53 README.md
[30 wlstanziano@bora ~/SUPERCOMPUTING/assignments/assignment_02 ]$cd data
[31 wlstanziano@bora ~/SUPERCOMPUTING/assignments/assignment_02/data ]$ls -l
total 1748
-rw-r-----. 1 wlstanziano gzdata440 1379902 Feb 11 13:32 GCF_000005845.2_ASM584v2_genomic.fna.gz
-rw-r-----. 1 wlstanziano gzdata440  406858 Feb 11 13:32 GCF_000005845.2_ASM584v2_genomic.gff.gz

# chmod
[35 wlstanziano@bora ~/SUPERCOMPUTING/assignments/assignment_02/data ]$chmod a+w GCF_000005845.2_ASM584v2_genomic.fna.gz
[36 wlstanziano@bora ~/SUPERCOMPUTING/assignments/assignment_02/data ]$chmod a+w GCF_000005845.2_ASM584v2_genomic.fna.gz
[37 wlstanziano@bora ~/SUPERCOMPUTING/assignments/assignment_02/data ]$ls -l
total 1748
-rw-rw-rw-. 1 wlstanziano gzdata440 1379902 Feb 11 13:32 GCF_000005845.2_ASM584v2_genomic.fna.gz
-r--r--r--. 1 wlstanziano gzdata440  406858 Feb 11 13:32 GCF_000005845.2_ASM584v2_genomic.gff.gz
[38 wlstanziano@bora ~/SUPERCOMPUTING/assignments/assignment_02/data ]$chmod a+w GCF_000005845.2_ASM584v2_genomic.gff.gz
[39 wlstanziano@bora ~/SUPERCOMPUTING/assignments/assignment_02/data ]$ls -l
total 1748
-rw-rw-rw-. 1 wlstanziano gzdata440 1379902 Feb 11 13:32 GCF_000005845.2_ASM584v2_genomic.fna.gz
-rw-rw-rw-. 1 wlstanziano gzdata440  406858 Feb 11 13:32 GCF_000005845.2_ASM584v2_genomic.gff.gz
[40 wlstanziano@bora ~/SUPERCOMPUTING/assignments/assignment_02/data ]$

#md5sum
#local
william:data$ md5sum GCF_000005845.2_ASM584v2_genomic.fna.gz GCF_000005845.2_ASM584v2_genomic.gff.gz
c13d459b5caa702ff7e1f26fe44b8ad7  GCF_000005845.2_ASM584v2_genomic.fna.gz
2238238dd39e11329547d26ab138be41  GCF_000005845.2_ASM584v2_genomic.gff.gz
#hpc
william:~$ md5sum GCF_000005845.2_ASM584v2_genomic.fna.gz GCF_000005845.2_ASM584v2_genomic.gff.gz
c13d459b5caa702ff7e1f26fe44b8ad7  GCF_000005845.2_ASM584v2_genomic.fna.gz
2238238dd39e11329547d26ab138be41  GCF_000005845.2_ASM584v2_genomic.gff.gz


#aliases
u - takes you up one directory, clears your terminal screen, shows where you are in your files, and shows contents
d - takes you back one directory, to wherever you were before, and shows contents
ll - gives a complete and detailed file listing

#reflection
A big problem for me was that I didn't have the WM VPN on my computer because I haven't been able to download it because my computer runs linux.
So that means I couldn't work on it off of campus. Hopefully I will be able to sort this out soon.
It took me a while to understand the whole chmod signs thing, like "r--r--r--" or "rw-rw-rw," for instance.


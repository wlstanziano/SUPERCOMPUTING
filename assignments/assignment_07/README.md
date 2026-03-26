# William Stanziano
# March 26, 2026
# Assignment 7

#1


#2
#search filters:
I typed in "human", and for Strategy I checked Genome


#3
# Cleans raw reads using fastp to remove sequencing adapters and low-quality bases.
# Used a local fastp binary in the programs folder to ensure the pipeline remains portable on the Bora cluster.


#4
Used bbmap.sh with a minimum alignment identity of 95 percent (minid=0.95).
Java memory was capped at 40GB (-Xmx40g) to accommodate the mammalian genome size.


#5
Used the -F 4 flag in samtools view to exclude unmapped reads. This ensures the final BAM files
only contain "significant positive matches" to the reference.


#6
I configured the job to request 50GB of RAM and 8 CPUs, while ensuring all standard output and error logs
were redirected to the output/ directory for systematic tracking.


#7
#checked my progress with the following line of code:
head -n 15 output/map_286948.err


#8
# We found some dog DNA!
| Sample ID | Total Reads | Dog-Mapped Reads |
| :--- | :--- | :--- |
| SRR32260018 | 1,084,160 | 0 |
| SRR32260082 | 12,298,124 | 131 |
| SRR34798404 | 95,614 | 0 |
| SRR35966631 | 3,013,164 | 3 |
| SRR37691212 | 1,141,028 | 0 |
| SRR37691242 | 2,288,320 | 0 |
| SRR37691243 | 1,142,634 | 0 |
| SRR37767465 | 142,829,786 | 0 |


#9
A big hurdle for me was resolving a "stale index" issue where BBMap was referencing an old
genome map, resulting in a mapping rate of near-zero. I also had to troubleshoot a directory-not-found
error by implementing automated folder creation (mkdir -p) within the pipeline to ensure Samtools had
a valid path to save the final BAM files.





# William Stanziano
# Assignment 4
# Feb. 26


#1
#already exists

#2
wget https://github.com/cli/cli/releases/download/v2.74.2/gh_2.74.2_linux_amd64.tar.gz
tar -xzvf gh_2.74.2_linux_amd64.tar.gz

#3
nano install_gh.sh
#within the install_gh.sh:
cd ~/programs
wget https://github.com/cli/cli/releases/download/v2.74.2/gh_2.74.2_linux_amd64.tar.gz
tar -xzvf gh_2.74.2_linux_amd64.tar.gz
rm gh_2.74.2_linux_amd64.tar.gz

#4
nano ~/.bashrc
#added to end of my .bashrc:
export PATH="$PATH:$HOME/programs/gh_2.74.2_linux_amd64/bin"

#5
gh auth login
git config --global user.name "wlstanziano"
git config --global user.email "wlstanziano@wm.edu"
gh auth login
gh auth status

#6
nano install_seqtk.sh
#within install_seqtk.sh:
cd ~/programs
git clone https://github.com/lh3/seqtk.git;
cd seqtk; make
echo "export PATH=$PATH:~/programs/seqtk" >> ~/.bashrc


#7
#moving genome_data into my assignment 4 directory
cp genome_data ~/SUPERCOMPUTING/assignments/assignment_04
#trying stuff out
seqtk
seqtk size genome_data
seqtk seq -U genome_data > uppercase_genome_data

#8
nano summarize_fasta.sh
#within summarize_fasta.sh
FASTA_FILE=$1

ALL_STATS=$(seqtk size "$FASTA_FILE")

TOTAL_SEQS=$(echo "$ALL_STATS" | wc -l)
TOTAL_BASES=$(echo "$ALL_STATS" | awk '{sum += $2} END {print sum}')

echo "----------------------------------------"
echo "FASTA SUMMARY REPORT: $FASTA_FILE"
echo "----------------------------------------"
echo "Total Number of Sequences: $TOTAL_SEQS"
echo "Total Number of Nucleotides: $TOTAL_BASES"
echo ""
echo "Table of Sequence Names and Lengths:"
echo "NAME         LENGTH"
echo "$ALL_STATS" | column -t
echo "----------------------------------------"

#9
cd data
cp genome_data data_1
cp genome_data data_2
cp genome_data data_3

for file in data/*.fasta; do ./summarize_fasta.sh "$file"; done


#10 - Reflection
#I had some problems with my PATHs at the end of my .bashrc, my existing one was too messy and it took some time to figure out what was wrong.
#Through this assignment I got a lot more comfortable moving files and copying/renaming them using mv and cp.
#$PATH is an environment variable we keep in our /bashrc file that contains a list of directories where the system looks for executable programs.
#When you type a command like ls, gh, or seqtk into the terminal, it  doesn't automatically know where those programs live - it has to look them up ; and $PATH is the first place it looks.

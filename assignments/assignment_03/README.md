#William Stanziano
#Feb. 19
#Assignment 3

# Task 1
mkdir data

# Task 2
wget https://gzahn.github.io/data/GCF_000001735.4_TAIR10.1_genomic.fna.gz
gunzip -c GCF_000001735.4_TAIR10.1_genomic.fna.gz > genome_data
rm GCF_000001735.4_TAIR10.1_genomic.fna.gz

# Task 3
#1
grep -c ">" genome_data
#2
grep -v "^>" genome_data | tr -d '\n' | wc -c
#3
wc -l genome_data
#4
grep "^>" genome_data | grep -c "mitochondrion"
#5
grep "^>" genome_data | grep -c "chromosome"
#6
grep -v "^>" genome_data | head -1 | tail -1 | wc -m                                                
grep -v "^>" genome_data | head -2 | tail -1 | wc -m
grep -v "^>" genome_data | head -3 | tail -1 | wc -m
#7
grep -v "^>" DATA | head -5 | tail -1 | wc -m
#8
grep -B 1 "AAAAAAAAAAAAAAAA" genome_data | grep "^>" | wc -l
#9
grep "^>" genome_data | sort | head -n 1
#10
grep -v "^>" genome_data > sequences.txt
grep "^>" genome_data > headers.txt
paste headers.txt sequences.txt > genome_data.tsv


#Reflection
Your approach and what you learned
I learned that you can type "man" before something like grep or wc, and it'll give you the documentation for it and tell you what all the letters like -m or -v mean after it. Most of the tasks were fairly easy except for 6 and 7 - as you can see, I ended up just deciding to split task 6 into three command lines.

Any command-line tools that surprised or frustrated you
Working on this assignment has made me come to the conclusion that I still don't fully grasp the difference between pipeline and redirection with "<" and ">" characters. I also need to better understand the how newline markers work and where they are in text documents, and how even though they exist, it's like they're invisible when you're just looking at the text file.

Why these kinds of skills are essential in computational work
Well these seems like very foundational computational tools and I'm very glad to be learning them. I really wish I would've learned all these computer fundamentals like Unix earlier in my Data Science curriculum.

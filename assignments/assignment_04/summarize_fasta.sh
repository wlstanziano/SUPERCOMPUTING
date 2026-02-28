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

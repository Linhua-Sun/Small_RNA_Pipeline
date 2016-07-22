# Small_RNA_Pipeline

### Tips 

1. Use samtools faidx to get the chromosome length size from TAIR10.fa(Reference Genome)

2. Or you can use use pyfaidx (Refer to <https://www.biostars.org/p/173963/>)

`pip install pyfaidx` and `faidx input.fasta -i chromsizes > sizes.genome`

`samtools faidx input.fa && cut -f1,2 input.fa.fai > sizes.genome`

3. You can also do it like this `cat file.fa | awk '$0 ~ ">" {print c; c=0;printf substr($0,2,100) "\t"; } $0 !~ ">" {c+=length($0);} END { print c; }'`

><http://www.danielecook.com/generate-fasta-sequence-lengths/> **Without Test!**

4. Insert a column in the file. Refer to <http://blog.uouo123.com/post/637.html> `awk '$2=$2" your words"' file`

### Binning Of Chromosome Data

<https://www.biostars.org/p/70577/>

`bedtools makewindows -g chrom.sizes -w 1000000 > genome.1Mb.bed`

 

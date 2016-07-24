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

### Little change

1. change the mapping script (add the sam read group). To help the final DE.

Refer to: <http://www.ncbi.nlm.nih.gov/pubmed/23610128> <http://www.ncbi.nlm.nih.gov/pubmed/27175019> <http://www.ncbi.nlm.nih.gov/pubmed/24139974>

	`samtools merge -@ 15 Merge.bam BN1_140_R1_clean_sorted.bam  BN1_141_R1_clean_sorted.bam  BN1_142_R1_clean_sorted.bam  BN1_143_R1_clean_sorted.bam &`

>  A common small RNA experiment generates **multiple libraries from technical or biological replicates, distinct tissues, individuals, or genotypes**. In such experiments, it is often desirable to derive **a set of de novo small RNA gene annotations based on the union of all of the data**, and then to **subsequently quantify small RNA expression at those loci in each of the input datasets separately**. As of version 1.1.0, ShortStack automatically handles all of these tasks in a single run. To illustrate this, install ShortStack.pl and its required dependencies (Section 2), download the tutorial data [12], unpack it, and cd into the unpacked TUTORIAL directory. Once there, type the following command.

(http://www.sciencedirect.com/science/article/pii/S1046202313004003)

2. How to understand the rRNA and tRNA problem.

> Refer to the RNA methods papers. 

>Unlike protein-coding genes, which have inherent nucleo- tide patterns that can be discerned computationally by scru- tinizing the genome sequence (e.g., open reading frames, splice sites, etc.), most small RNA genes do not have known primary sequence features to allow confident a priori predic- tion (one exception is highly conserved MIRNA genes).
>Definition of small RNA genes is largely empirical, based upon the pattern of small RNA alignments to a reference genome
>MIRNA loci produce a discrete pattern of alignments to a single genomic strand, with a major species (the mature miRNA) separated by a short distance from a second, minor species (the miRNA  that is excised along with the mature miRNA during its biogenesis).
>In contrast, endogenous siRNAs derived from long, double-stranded RNA (dsRNA) generate a dispersed pattern of alignments to both genomic strands, while small RNAs produced by fragmentation of a single-stranded precursor will be dispersed along a single genomic strand.
>Another key property of small RNA genes is the distribu- tion of small RNA sizes produced by the locus.
>For in- stance, in plants mature miRNAs are usually 21 nt in length, most endogenous siRNAs are 24 nt long, and 22-nt RNAs have unique molecular consequences on their targets

**Furthermore, small RNAs de- rived from fragmentation of abundant RNAs in any species (rRNA and tRNA fragments, for instance) often have a wider size distribution, especially in the very small sizes, that exceeds the size range normally associated with small RNA regulatory function.**




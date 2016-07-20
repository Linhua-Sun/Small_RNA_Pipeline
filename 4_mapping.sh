#!/bin/bash

## Linhua Sun
## mapping reads on the Ath genome. Code inspried from ShortStark.

# gzip -d -c BN1_143_R1_clean.fq.gz | bowtie -q -v 1 -p 5 -S -a -m 50 --best --strata --sam-RG ID:BN1_143_R1_clean Athaliana_167 -

for i in *.fq.gz
do
	RGID=$(basename ${i} .fq.gz)
	echo ${RGID}
	echo ${i}
	gzip -dc ${i} | bowtie -q -v 1 -p 5 -S -a -m 50 --best --strata --sam-RG ID:"${RGID}" Athaliana_167.fa - -S | \
	samtools view  -b | \
	sambamba sort -t 5 -o mismatch_1_${RGID}_sorted.bam /dev/stdin
done



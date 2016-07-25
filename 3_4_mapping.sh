#!/bin/bash

## Linhua Sun
## mapping reads on the Ath genome. Code inspried from ShortStark.

# gzip -d -c BN1_143_R1_clean.fq.gz | bowtie -q -v 1 -p 5 -S -a -m 50 --best --strata --sam-RG ID:BN1_143_R1_clean Athaliana_167 -

# annotation again: change the sam-RG read group.



REFGENOME="/sdd1/users/linhua/QIAN_LAB/ATH_SHORTSTARK/Athaliana_167.fa"

THREADS=5

OUTDIR="SM_Merge_MAPPING_OUTPUT"

DATA=$(find ./CLEAN_READS/ -name "*.gz")

echo ${DATA}

if [ ! -d ${OUTDIR} ]
		then mkdir -p ${OUTDIR}
fi


for i in ${DATA}
do
	ID=$(basename ${i} .fq.gz)
	echo "Sample path is ${i}."
	echo "Sample Id is ${ID}."
	gzip -dc ${i} | bowtie -q -v 1 -p ${THREADS} -S -a -m 50 --best --strata --sam-RG ID:"${ID}" --sam-RG SM:"${ID}" ${REFGENOME} - -S | \
	samtools view -@ ${THREADS} -b | \
	sambamba sort -t ${THREADS} -o ${OUTDIR}/${ID}_sorted.bam /dev/stdin
done

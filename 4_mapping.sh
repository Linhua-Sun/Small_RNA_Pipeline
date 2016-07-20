#!/bin/bash

## Linhua Sun
## mapping reads on the Ath genome. Code inspried from ShortStark.

# gzip -d -c BN1_143_R1_clean.fq.gz | bowtie -q -v 1 -p 5 -S -a -m 50 --best --strata --sam-RG ID:BN1_143_R1_clean Athaliana_167 -


REFGENOME="/sdd1/users/linhua/QIAN_LAB/ATH_SHORTSTARK/Athaliana_167.fa"

THREADS=5

OUTDIR="MAPPING_OUTPUT"

DATA=$(find ./CLEAN_READS/ -name "*.gz")

echo ${DATA}

if [ ! -d ${OUTDIR} ]
		then mkdir -p ${OUTDIR}
fi


for i in ${DATA}
do
	echo ${i}
	gzip -dc ${i} | bowtie -q -v 1 -p ${THREADS} -S -a -m 50 --best --strata ${REFGENOME} - -S | \
	samtools view -@ ${THREADS} -b | \
	sambamba sort -t ${THREADS} -o ${OUTDIR}/${RGID}_sorted.bam /dev/stdin
done

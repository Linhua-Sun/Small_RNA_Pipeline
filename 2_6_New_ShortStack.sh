#!/bin/bash

# Linhua Sun
# Batch run the shortshack
# Wed Jul 20 11:22:39 EDT 2016
# change the loci. Steps = 200bp 
# array: http://c.biancheng.net/cpp/view/7002.html


OUTDIR="Final_4_samples_SHORT_STARK_RESULTS"
REFGENOME="/sdd1/users/linhua/QIAN_LAB/ATH_SHORTSTARK/Athaliana_167.fa"
DATA=($(find ./MAPPING_OUTPUT/ -name "*.bam"))

if [ ! -d ${OUTDIR} ]
		then mkdir -p ${OUTDIR}
fi

for i in {0..3}
do
	ID=$(basename ${DATA[i]} _R1_clean_sorted.bam)
	echo "Sample ID is ${ID}."
	echo "Value i=${i}."
	New_ShortStack --outdir ${OUTDIR}/${ID}_OUTPUT --bamfile ${DATA[i]}  --genomefile ${REFGENOME} --locifile small_RNA_loci.txt  &
done

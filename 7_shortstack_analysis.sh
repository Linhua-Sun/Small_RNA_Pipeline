#!/bin/bash

# Linhua Sun
# Batch run the shortshack
# Wed Jul 20 11:22:39 EDT 2016

# array: http://c.biancheng.net/cpp/view/7002.html


OUTDIR="Merge_SHORT_STARK_RESULTS"
REFGENOME="/sdd1/users/linhua/QIAN_LAB/ATH_SHORTSTARK/Athaliana_167.fa"
DATA=($(find  Merge_MAPPING_OUTPUT/ -name "Merge.bam"))

if [ ! -d ${OUTDIR} ]
		then mkdir -p ${OUTDIR}
fi


ID=$(basename ${DATA[0]} .bam)
echo "Sample ID is ${ID}."
echo "Value i=${0}."
New_ShortStack --nohp --outdir ${OUTDIR}/${ID}_OUTPUT --bamfile ${DATA[0]}  --genomefile ${REFGENOME} &

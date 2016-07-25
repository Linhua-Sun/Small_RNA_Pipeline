#!/bin/bash

# shortstack init from the raw reads ++ test


OUTDIR="Test_raw_reads_SHORT_STARK_RESULTS"
REFGENOME="/sdd1/users/linhua/QIAN_LAB/ATH_SHORTSTARK/Athaliana_167.fa"
DATA=($(find RAW-DATA-2016-07-19/ -name "*.gz"))

echo ${DATA[@]}

if [ ! -d ${OUTDIR} ]
		then mkdir -p ${OUTDIR}
fi

New_ShortStack --outdir ${OUTDIR}/test1  --adapter AGATCGGAAGAGCACACGTC --readfile ${DATA[0]} ${DATA[1]} ${DATA[2]} ${DATA[3]}  --genomefile ${REFGENOME}


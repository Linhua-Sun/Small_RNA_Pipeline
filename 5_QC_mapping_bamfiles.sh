#!/bin/bash

# QC on BAM files
# Linhua Sun



OUTDIR="QC_MAPPING_BAMFILS"

if [ ! -d ${OUTDIR} ]
		then mkdir -p ${OUTDIR}
fi

DATA=$(find ./MAPPING_OUTPUT/ -name "*_sorted.bam")

fastqc -o ${OUTDIR} ${DATA}



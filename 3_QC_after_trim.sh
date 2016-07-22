#!/bin/bash

DATA=$(find ./ -name "*_clean.fq.gz")

echo ${DATA}

fastqc -o QC_AFTER_cutadapt ${DATA}

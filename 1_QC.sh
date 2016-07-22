#!/bin/bash

DATA=$(find ./ -name "*.fq.gz")

echo ${DATA}

fastqc -o QC_BEFORE_cutadapt ${DATA} 


#!/bin/bash

# aim : cut adaptor from the raw data of small RNA sequencing project.

# Linhua Sun

# date : 2016-07-20

DATA=$(find ./ -name "*.fq.gz")

echo ${DATA}

for i in ${DATA}
do
ID=$(basename ${i} .fq.gz)
cutadapt --discard-untrimmed -m 15 -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC -o ./CLEAN_READS/${ID}_clean.fq.gz ${i} > ./CLEAN_READS/${ID}_cutadapt_$(date +%F).log &
done


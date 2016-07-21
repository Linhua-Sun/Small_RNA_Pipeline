#!/bin/bash



# analysis the output of fastqc 
# on the file: fastqc_data.txt

echo "Input file is $1."
Test=($(cat -n "${1}"|grep ">>" |grep ">>Sequence Length Distribution" -A 1|cut -f1))
echo "Line Numbers are ${Test[@]}."

ID=$(echo "${1}"|tr "/" "-")

echo "ID = ${ID}."

sed -n "${Test[0]},${Test[1]}p" "${1}"|grep -v ">>" | sed "s/#//g" > ${ID}_Sequence_Length_Distribution.txt

echo "Sequence Length Distribution have been writen into file ${ID}_Sequence_Length_Distribution.txt." 

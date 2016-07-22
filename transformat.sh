#!/bin/bash

cat ${1} | while read line
do
	data=(${line})
	echo "${data[0]}:${data[1]}-${data[2]}"
done

# you can also do it like this awk '{OFS="";print $1,":",$2,"-",$3}' test.bed

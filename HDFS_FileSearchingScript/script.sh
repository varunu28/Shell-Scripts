#!/bin/bash
dir=/home/cloudera/Desktop/test/*
for file in {.,}*; do 
	if [ ${#file} -gt 2 ];
	then
		echo "$file";
		hdfs dfs -test -e /user/test/$file
		rc=$?
		if [ $rc -eq 0 ];
		then
			echo "$file is Present in HDFS";
			numLines=$(hdfs dfs -cat /user/test/$file|wc -l)
			space=$(hadoop fs -ls /user/test/$file| tr -s ' ' |cut -d' ' -f5)
			echo "Num of lines in $file: $numLines"
			echo "Space of $file: $space bytes"
		else
			echo "$file is not Present in HDFS";
		fi
	fi
 done

#!/bin/bash
hdfs dfs -ls /user/testlogs > files.txt
for file in $(cat files.txt); do
	if [[ $file == *".err" ]];then
	  lineNum=$(hadoop fs -cat $file | awk '/Unrecognized argument: hive-database/ {print NR}')
	  if [ ! -z "$lineNum" ];then
	    echo $file
            echo $lineNum
	  fi
	fi
done
rm files.txt

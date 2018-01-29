#!/bin/bash

FILES="$(ls *[^x]csv)"
count=1
for file in $FILES
do
	c=1
	if [ $count -eq 1 ];
	then
		while IFS= read -r line;do
		    echo "$line" >> testFile.txt
		done < $file
	else
		while IFS= read -r line;do
			if [ $c -eq 1 ];
			then
				c=$((c+1))
			else
		    	echo "$line" >> testFile.txt
		    fi
		done < $file
	fi
	echo "completed"+$count
	count=$((count+1))
	echo "$(cat $file | wc -l)" + " : " + "$(cat testFile.txt | wc -l)"
done
mv testFile.txt testFile.csv
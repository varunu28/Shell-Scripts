#!/bin/bash
read -p "Enter the complete path to the directory: " path
newPath="$path/*"

du -s $newPath | cut -d $'\t' -f 1 > space
ls $path | sed "s/.*\///">filename

paste -d ' ' filename space>mainFile
rm space filename

file1=$(sort -k 2 -n -r mainFile | sed -n 1,3p | cut -d ' ' -f 1,2 --output-delimiter ':')

echo "Top 3 folders consuming maximum space are: "
for folder in $file1
do
  echo "$folder K"
done

rm mainFile 

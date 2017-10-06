#!/bin/bash
read num
sum=0
i=0
while [ $i -lt $num ]
do 
	read n
	sum=$[$sum+$n]
	i=$[$i+1]
done

printf "%.3f\n" $(bc -l <<< "$sum/$num")


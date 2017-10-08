#!/bin/bash
a=($(cat))
declare -a patter=( ${a[@]/*[a,A]*/} )
echo ${patter[@]}

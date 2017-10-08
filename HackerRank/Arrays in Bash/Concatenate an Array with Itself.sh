#!/bin/bash
a=($(cat))
copy=("${a[@]}" "${a[@]}" "${a[@]}")
echo ${copy[@]}

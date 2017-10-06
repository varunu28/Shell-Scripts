#!/bin/bash
echo "$(cut -d$'\t' -f1-3 /dev/stdin)"

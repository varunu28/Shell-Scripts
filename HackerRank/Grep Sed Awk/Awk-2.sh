#!/bin/bash
awk '{if ($4 < 50 ""||$3 < 50||$2 < 50) print $1,": Fail"; else print $1,": Pass";}'

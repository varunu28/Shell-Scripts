#!/bin/bash
awk '{if ($4 == ""||$3 == ""||$2 == "") print "Not all scores are available for",$1;}'

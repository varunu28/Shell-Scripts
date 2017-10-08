#!/bin/bash
a=($(cat))
echo ${a[@]:3:5}

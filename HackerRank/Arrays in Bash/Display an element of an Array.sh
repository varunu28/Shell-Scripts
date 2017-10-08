#!/bin/bash
a=($(cat))
echo ${a[@]:3:1}

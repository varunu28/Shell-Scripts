#!/bin/bash
a=($(cat))
echo ${a[@]/[A-Z]/.}

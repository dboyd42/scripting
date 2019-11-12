#!/bin/bash
# Copyright 2019 David Boyd, all rights reserved
# Program: Array Math
# Description:
#     This script multiples two arrays from different files,
#     then writes the product's square root to an out file.
# Date: Tue Nov 12 2019
# Revised:
#     <revision date>

decimals=2
# a=$((bc <<< "scale=$decimals; sqrt($VAR)"))


inFiles=2   ## number of input files

###
### Get Input Files
###
getInFiles() {
    for (( i=1; i<$inFiles+1; ++i ))
    do
        read -p "Enter input file $i: " inFile[$i]
        #echo "infile $i: " ${inFile[$i]}
    done
}

###
### Main
###
main() {
    getInFiles
}

###
### Run Program
###
main
exit 0


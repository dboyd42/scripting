#!/bin/bash
# Copyright 2019 David Boyd, all rights reserved
# Program: Array Math
# Description:
#     This script multiples two arrays from different files,
#     then writes the product's square root to an out file.
# Date: Tue Nov 12 2019
# Revised:
#     <revision date>

###
### Declare Vars
###
tempArr=()
inputArrX=()
inputArrY=()
outputArrZ=()
inFile=()       # list of input files
numFiles=2      # number of input files
decimals=2      # decimal places used for scale
boolFileExists=0

# a=$((bc <<< "scale=$decimals; sqrt($VAR)"))

###
### Get Input Files
###
getInFiles() {
    inFile[0]=x-arr.txt         # function below works
    inFile[1]=y-arr.txt         # hardcoded - to be deleted later
    boolFileExists=1
    #for (( i=1; i<$numFiles+1; ++i ))
    #do
    #    boolFileExists=0
    #    while [boolFileExists -eq 0]
    #    do
        #    read -p "Enter input file $i: " inFile[$i]
        #    echo "infile $i: " ${inFile[$i]}
        #    checkFile "${inFile[$i]}"
    #    done
    #done
}

###
### Read inFile into an Array
###
readFile() {
    if [[ $boolFileExists -eq 1 ]]; then
        for i in $numFiles
        do
            while read -r line; do
                # Read $line into array
                read -a tempArr <<< $line
            done < $1
        done
    fi
}

###
### main
###
main() {
    getInFiles
    echo ${inFile[0]}   # x-arr.txt
    echo ${inFile[1]}   # y-arr.txt
    file1="x-arr.txt"
    file2="y-arr.txt"
    #checkfiles

    readFile ${inFile[0]}
    inputArrX=${tempArr[@]}
    echo "arrX =" ${inputArrX[@]}

    #readFile "$file2"
    readFile ${inFile[1]}
    inputArrY=${tempArr[@]}
    echo "arrY =" ${inputArrY[@]}

    echo "--------------------"
    echo "arrX =" ${inputArrX[@]}
    echo "arrY =" ${inputArrY[@]}

}

###
### Run Program
###
main
exit 0


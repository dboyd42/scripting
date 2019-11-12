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
boolFileExists=0  # value for inFile's existence
decimals=2        # decimal places used for scale
numFiles=2        # number of input files
tempArr=()        # holds the temp input arrays
inFile=()         # list of input files
inputArrX=()      # first array
inputArrY=()      # second array
multiArr=()       # multiplied arrays value
outputArrZ=()     # square-root values


# used for hardcoding while testing
    inFile[0]=x-arr.txt         # function below works
    inFile[1]=y-arr.txt         # hardcoded - to be deleted later
    boolFileExists=1


###
### Get Input Files
###
getInFiles() {
    for (( i=1; i<$numFiles+1; ++i ))
    do
        boolFileExists=0
        while [boolFileExists -eq 0]
        do
           read -p "Enter input file $i: " inFile[$i]
           echo "infile $i: " ${inFile[$i]}
           checkFile "${inFile[$i]}"
        done
    done
}

###
### Multiply arrays
###
###
multiplyArrays() {
    #findGreatestSize
    size=${#inputArrX[@]}
    for (( i=0; i<$size; ++i ))
    do
        multiArr[$i]=$(( ${inputArrX[$i]} * ${inputArrY[$i]} ))
    done
    echo "multiArr's : " ${multiArr[@]}
}

###
### Read inFile into an Array
###
#readFile() {

#}

###
### Square Root Array
###
sqrRoot() {
    echo
    #for i in "${multiArr[@]}"
    for (( i=0; i<$size; ++i ))
    do
        outputArrZ[$i]=$( bc <<< "scale=$decimals; sqrt(${multiArr[$i]})")
                  #avg=$( bc <<< "scale=$decimals;$sum/$numbers_length")
    done
    echo "output z's : " ${outputArrZ[@]}
}

###
### main
###
main() {
    # get input filenames
    #getInFiles
    echo ${inFile[0]}   # x-arr.txt
    echo ${inFile[1]}   # y-arr.txt
    #checkfiles

    # Get input arrays                                  ### stderr: != array
    readarray -d ' ' inputArrX < ${inFile[0]}
    readarray -d ' ' inputArrY < ${inFile[1]}

    # multiple arrays
    multiplyArrays

    # square root multiplied array
    sqrRoot

    # square root multipled array

    # display output
    echo "--------------------"
    echo "arrX =" ${inputArrX[@]} "| size = " ${#inputArrX[@]}
    echo "arrY =" ${inputArrY[@]} "| size = " ${#inputArrY[@]}

}

###
### Run Program
###
main
exit 0


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
outFile=""        # output filename
tempArr=()        # holds the temp input arrays
inFile=()         # list of input files
inputArrX=()      # first array
inputArrY=()      # second array
multiArr=()       # multiplied arrays value
outputArrZ=()     # square-root values


# used for hardcoding while testing
#    inFile[0]=x-arr.txt         # function below works
#    inFile[1]=y-arr.txt         # hardcoded - to be deleted later
#    boolFileExists=1


###
### Check File Status
###
checkFile() {
    echo
    if [ -f $1 ]; then
        boolFileExists=1
    else
        boolFileExists=0
        echo "Invalid filename"
    fi
}
###
### Get Input Files
###
getInFiles() {
    for (( i=0; i<$numFiles; ++i ))
    do
        boolFileExists=0
        while [ $boolFileExists -eq 0 ]
        do
            let j=($i +1)
            read -p "Enter input file $j: " inFile[$i]
           checkFile "${inFile[$i]}"
        done
    done
}

###
### Get Output File
###
###
getOutFile() {
    read -p "Save to: " outFile
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
}

###
### Read inFile into an Array
###
readFile() {
    readarray -d ' ' inputArrX < ${inFile[0]}
    readarray -d ' ' inputArrY < ${inFile[1]}

}

###
### Square Root Array
###
sqrRoot() {
    size=20
    for (( i=0; i<$size; ++i ))
    do
        outputArrZ[$i]=$( bc <<< "scale=$decimals; sqrt(${multiArr[$i]})")
                  #avg=$( bc <<< "scale=$decimals;$sum/$numbers_length")
    done
}

###
### Write to Output File
###
writeFile() {
    echo "${inputArrX[@]}${inputArrY[@]}${outputArrZ[@]}" > $outFile
}
###
### main
###
main() {
    # get input filenames
    getInFiles

    # Get input arrays
    readFile

    # multiple arrays
    multiplyArrays

    # square root multiplied array
    sqrRoot

    # Get output file
    getOutFile

    # Write to outfile
    writeFile
}

###
### Run Program
###
main
exit 0


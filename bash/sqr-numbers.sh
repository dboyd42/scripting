#!/bin/bash
# Copyright 2019 David Boyd, all rights reserved
# Program: Square Numbers - Read File
# Description:
#     This script reads a file then squares of all the numbers read.
#     The output is then written to an output file.
# Date: Thu Nov 7 2019
# Revised:
#       Mon Nov 11 2019

###
### Declare vars
###
array=()    # original array
sqrArr=()   # squared array
inFile=$1   # @parm CLI[1]
outFile=""  # filename to write to
boolFileExists=0

###
### Check File Status
###
checkFile() {
    if [ -f "$inFile" ]; then
        boolFileExists=1
        inFile=$inFile
    else
        getFile
    fi
}

###
### Get File
###
getFile() {
    # check if file is exists
    read -p "Enter filename: " inFile
    checkFile "$inFile"
    clear
}

###
### Get Output Filename
###
getOutFilename() {
   read -p "Save to: " outFile
}
###
### Read inFile into an Array
###
readFile() {
    if [[ $boolFileExists -eq 1 ]]; then
        while IFS='/' read -r line; do
            # strip '/' from file
            line=${line///}
            # Read $line into array
            read -r -a array <<< $line
        done < $inFile
    fi
}

###
### Square Numbers
###
sqrNumbers() {
for i in "${array[@]}"
    do
        #echo $(($i ** 2)) >> $outFile
        sqrArr[$i]=$(( $i ** 2 ))
    done
}

###
### Write Squared Values to File
###
writeFile() {
    echo "${sqrArr[@]}" >> $outFile
}

###
### Main
###
main() {
    checkFile "$inFile"
    readFile
    sqrNumbers
    getOutFilename
    writeFile
}

###
### Run Program
###
main


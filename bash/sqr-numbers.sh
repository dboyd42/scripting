#!/bin/bash
# Copyright 2019 David Boyd, all rights reserved
# Program: Square Arrays - Read File
# Description:
#     This script reads a file then squares of all the numbers read.
#     The output is then written to an output file.
# Date: Thu Nov 7 2019
# Revised:
#     <revision date>

###
### Declare vars
###
array=()    # original array
sqrArr=()   # modified array
#inFile="./data-files/arr01.txt"
inFile="/dev/null"
tempFile="./temp.txt"
outFile="./outFile_sqr-N"
boolFileExists=0

###
### Check for file existence
###
fileExists() {
    # check if file is exists
    if [ -f "$1" ]; then
        boolFileExists=1
        inFile=$1
        echo "if -f \$1"
    elif [ -r $inFile ]; then
        boolFileExists=1
        echo "elif -f \$inFile"
    else
        read -p "Enter filename: " $inFile
        #clear
        #data-files/arr01.txt
        fileExists $inFile

    fi
}

###
### Read File Into an Array
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
### Calculate & Write Squared Values to File
###
for i in "${array[@]}"
do
    echo $(($i ** 2)) >> $outFile
    sqrArr+=$(($i ** 2))
done

fileExists "$inFile"
echo $boolFileExists


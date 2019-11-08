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
array=()
sqrArr=()
inFile="./data-files/arr01.txt"
tempFile="./temp.txt"
outFile="./outFile-sqr(N).txt"

###
### Read File Into an Array
###
if [[ -f "$inFile" ]]; then

    # Read file
    while IFS='/' read -r line; do
        echo "line = $line"
        # string manip -> ${string//substring/replacement}
        line=${line///}
        echo "line after str manip = "$line
        # Read line into array
        read -r -a array <<< $line
    done < $inFile

else
    # ask for new file
    echo 'Invalid file'
fi

###
### Calculate & Write Squared Values to File
###
for i in "${array[@]}"
do
    echo $(($i ** 2)) >> $outFile
    sqrArr+=$(($i ** 2))
done


echo "array = "${array[@]}
echo "line = "$line
echo "sqArr = "${sqrArr[@]}


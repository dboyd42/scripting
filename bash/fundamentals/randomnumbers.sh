#!/bin/bash
# Copyright 2019 David Boyd, all rights reserved
# Program: Random Numbers
# Description:
#     This script writes random numbers to a file.
# Date: Tue Nov 12 2019
# Revised:
#     <revision date>

###
### Get size and range
###
read -p "Enter the number of random numbers: " size
read -p "Enter range (or '0') for numbers : " range
for ((i=0;i<$size;++i))
do
    if [[ $range -eq 0 ]]; then
        randomArray[$i]+=$RANDOM
    else
        randomArray[$i]+=$(($RANDOM%$range))
    fi
done

###
### Get outfile
###
read -p "Save to: " outFile


###
### Write to outfile
###
echo ${randomArray[@]} > $outFile

exit 0


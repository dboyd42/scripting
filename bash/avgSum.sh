#!/bin/bash
# Copyright 2019 David Boyd, all rights reserved
# Program: Average Sum
# Description:
#     Calculates the sum and average of 10 numbers.
# Date: Fri Oct 11 09:00:00 CDT 2019
# Revised:
#     Mon Oct 21 15:36:20 CDT 2019
#     Sat Oct 12 18:26:06 CDT 2019

### Variables                                                               ###
SIZE_RESTRICTION=10             # Arrays restriction size
DECIMALS=2                      # n Decimal places for formatting results

### Functions                                                               ###
display_prgmName() {
    echo -e "\n\n"
    echo -e "\t\t++============================++"
    echo -e "\t\t|| Sum And Average Calculator ||"
    echo -e "\t\t++============================++"
    echo -e "\n\n"
}
setArray() {
        echo -e "Enter $SIZE_RESTRICTION Numbers"
        for ((i=1;i<$SIZE_RESTRICTION+1;++i));
        do
            read -p "Number $i: " NUMNUMS[$i]
        done
}
sumArray() {
    SUM=0.0
    SIZE=${#NUMNUMS[@]}
    SUM=$( IFS="+"; bc <<< "${NUMNUMS[*]}" )
}
avgArray() {
    AVG=$(bc <<< "scale=$DECIMALS;$SUM/$SIZE")
}
getAvg() {
    echo $AVG
}
getSize() {
    echo $SIZE
}
getSum() {
    echo $SUM
}
display_data() {
    echo -e 'Array values | ' ${NUMNUMS[*]}
    echo -e 'Array size   | ' $SIZE
    echo -e 'SUM          | ' $SUM
    echo -e 'AVG          | ' $AVG
}
main() {
    display_prgmName
    setArray
    sumArray
    avgArray
    echo ""
    display_data
    echo ""
    getSum
    getAvg
}
### RUN MAIN PROGRAM                                                        ###
main


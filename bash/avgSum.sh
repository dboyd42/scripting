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
size_restriction=10             # Arrays restriction size
decimals=2                      # n Decimal places for formatting results

### Functions                                                               ###
avgArray() {
    avg=$(bc <<< "scale=$decimals;$sum/$numbers_length")
}
display_prgmName() {
    echo -e "\n"
    echo -e "\t\t++============================++"
    echo -e "\t\t|| Sum And Average Calculator ||"
    echo -e "\t\t++============================++"
    echo -e "\n"
}
display_results() {
    echo "Sum: $sum";
    echo "Avg: $avg";
}
main() {
    display_prgmName
    setArray
    sumArray
    avgArray
    echo
    display_results
    echo -e "\nTotals"
    echo -e "======"
    pretty_print
}
pretty_print() {
    echo -e 'Array values | ' ${numbers[*]}
    echo -e 'Array size   | ' $numbers_length
    echo -e 'Sum          | ' $sum
    echo -e 'Avg          | ' $avg
}
setArray() {
        echo -e "Input $size_restriction Numbers"
        for ((i=1;i<$size_restriction+1;++i));
        do
            read -p "Input #$i: " numbers[$i]
        done
}
sumArray() {
    sum=0.0
    numbers_length=${#numbers[@]}
    sum=$( IFS="+"; bc <<< "${numbers[*]}" )
}
### Run main program                                                        ###
main


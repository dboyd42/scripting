#!/bin/bash
# Copyright 2019 David Boyd, all rights reserved
# Program: Average Sum
# Description:
#     Calculates the sum and average of 10 numbers.
# Date: Fri Oct 11 09:00:00 CDT 2019
# Revised:
#     Sat Oct 12 18:26:06 CDT 2019

###############################################################################
### Variables                                                               ###
###############################################################################
SIZE_RESTRICTION=10           # Arrays restriction size
NUMNUMS=(0 1 2 3 4 5 6 7 8 9)   # Default array
DECIMALS=2                      # n Decimal places for formatting results
NEWLINE_MIDF=15                 # Format with 15 newlines

###############################################################################
### Functions                                                               ###
###############################################################################
clear_the_screen() {
    if [ -z "$1" ]
    then
        END=50
    else
        END=$1
    fi
    for ((i=1;i<=END;i++)); do
        echo -e "\n"
    done
}
display_prgmName() {
    echo -e "\t\t++============================++"
    echo -e "\t\t|| Sum And Average Calculator ||"
    echo -e "\t\t++============================++"
    clear_the_screen NEWLINE_MIDF
}
getArray() {
        clear_the_screen
        echo -e "\nEnter $SIZE_RESTRICTION numbers"
        read -a NUMNUMS
}
displayQuestion() {
    echo -e "Would You Like to Input Your Own Numbers?"
    echo -e "-----------------------------------------"
}
displayBadOption() {
        clear_the_screen
        echo -e "\t\t++================++"
        echo -e "\t\t||   DUMBASS!!!   ||"
        echo -e "\t\t++================++"
        clear_the_screen `expr NEWLINE_MIDF+2`
        sleep 0.25
        clear_the_screen
        echo -e "\t\t++================++"
        echo -e "\t\t||   BAD CHOICE   ||"
        echo -e "\t\t++================++"
        clear_the_screen `expr NEWLINE_MIDF+2`
        read -p "Press enter to continue..."
        clear_the_screen
        display_prgmName
        displayQuestion
        echo "Enter [1] for \"YES\""
        echo -e "Enter [2] for \"NO\" \n"
}
getChoice() {
    displayQuestion
    OPTIONS="YES NO"

    select opt in $OPTIONS; do
    if [ "$opt" = "YES" ]; then
        getArray
        break
    elif [ "$opt" = "NO" ]; then
        echo 'Array Values: ' ${NUMNUMS[@]}
        break
    else
        displayBadOption
    fi
    done
}
shrink_array() {
    # Shrink array size to $SIZE_RESTRICTION elements
    NUMNUMS=( "${NUMNUMS[@]:0:$SIZE_RESTRICTION}" )
}
check_array_size() {
SIZE=${#NUMNUMS[@]}
if [ "$SIZE" -gt "$SIZE_RESTRICTION" ]; then
    echo "Your array is greater than $SIZE_RESTRICTION!"
    clear_the_screen 5
    echo "Shrinking array size to $SIZE_RESTRICTION"
    clear_the_screen NEWLINE_MIDF
    read -p "Press enter to continue..."
    shrink_array

elif [ "$SIZE" -lt "$SIZE_RESTRICTION" ]; then
        echo I know you only input $SIZE numbers!
        clear_the_screen 5
        echo -e "\nI'll continue with your sum and average regardless...\n"
        clear_the_screen NEWLINE_MIDF
        read -p "Press enter to continue..."
fi
}
sumArray() {
    SUM=0.0
    SIZE=${#NUMNUMS[@]}
    SUM=$( IFS="+"; bc <<< "${NUMNUMS[*]}" )
}
avgArray() {
    AVG=$(bc <<< "scale=$DECIMALS;$SUM/$SIZE")
}
display_data() {
    echo -e "\t\t=============================================="
    echo -e "\t\t||   TOTALS                                 ||"
    echo -e "\t\t=============================================="
    echo -e '\t\t|| Array values | ' ${NUMNUMS[*]}
    echo -e '\t\t|| Array size   | ' $SIZE
    echo -e '\t\t|| SUM          | ' $SUM
    echo -e '\t\t|| AVG          | ' $AVG
    echo -e "\t\t=============================================="
}
results() {
    echo $SUM
    echo $AVG
}
### main Run program with formatted displays --pretty print                 ###
main() {
    clear_the_screen
    display_prgmName
    echo ""
    getChoice
    clear_the_screen
    check_array_size
    clear_the_screen
    sumArray
    avgArray
    display_data
    clear_the_screen NEWLINE_MIDF
}
### main 2 Run program using CLI arguments as input for array               ###
#main2() {
#    if [ "$#" -gt 0 ]; then
#        echo "Number of args (#) are " $#
#        args=$#
#        echo $args
#        #NUMNUMS=
#    fi
#    #echo "Number of args (#) are " $#
#    #args=$#
#    #echo $args
#    read -a NUMNUMS
#    sumArray
#    avgArray
#    results
#}
### Main 3 runs the program without echo --used for outputting to textfile ####
main3() {
    read -a NUMNUMS
    sumArray
    avgArray
    results
}
### Run Program based off cli arg if provided                               ###
run() {
    if [ $1 = "main2" ]; then
        main2
    elif [ $1 = "main3" ]; then
        main3
    else
        main
    fi
}
###############################################################################
### RUN PROGRAM                                                             ###
###############################################################################
run $1


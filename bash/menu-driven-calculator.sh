#!/bin/bash
# Copyright 2019 David Boyd, all rights reserved
# Program: Menu-Driven Calculator
# Description:
#     Acts in place of a basic calculator
# Date: Tue Nov 12 2019
# Revised:
#     <revision date>

###
### Declare Vars
###
choice=0        # menu choice
difference=0    # return subtract
number1=0       # number to be manipulated
number2=0       # number to be manipulated
product=0       # return multiply
quotient=0      # return dividing
remainder=0     # return modulus
sum=0           # return addition

###
### prgm_title
###
Prgm_title() {
    echo -e "\n\t\tMain Menu"
    echo -e "\t1--------------------ADD"
    echo -e "\t2--------------------SUB"
    echo -e "\t3--------------------MPY"
    echo -e "\t4--------------------MOD"
    echo -e "\t5--------------------DIV"
    echo -e "\t6--------------------EXIT"
    echo
}

###
### EXIT
###
Exit() {
    exit 0
}

###
### Perform Calculation
###
Perform() {
    case "$1" in
            1)
                echo
                SetNumbers
                SetAdd $number1 $number2
                echo -e "\nSum = $sum\n"
                read -p "Press Enter to Continue..." null
                clear
                ;;

            2)
                echo
                SetNumbers
                SetSub $number1 $number2
                echo -e "\nDifference = $difference\n"
                read -p "Press Enter to Continue..." null
                clear
                ;;

            3)
                echo
                SetNumbers
                SetMpy $number1 $number2
                echo -e "\nProduct = $product\n"
                read -p "Press Enter to Continue..." null
                clear
                ;;
            4)
                echo
                SetNumbers
                SetMod $number1 $number2
                echo -e "\nRemainder = $remainder\n"
                read -p "Press Enter to Continue..." null
                clear
                ;;
            5)
                echo
                SetNumbers
                SetDiv $number1 $number2
                echo -e "\nQuotient = $quotient\n"
                read -p "Press Enter to Continue..." null
                clear
                ;;

            6)
                Exit
                ;;

            *)
                echo -e "\nInvalid Option"
                read -p "Press Enter to Continue..." null
                clear
    esac
}

###
### Set Choice
###
SetChoice() {
    read -p "Enter Choice [1-6]: " choice
}

###
### Add
###
SetAdd() {
    let sum=($1 + $2)
}

###
### DIV
###
SetDiv() {
    quotient=$( bc <<< "scale=2; ($1 / $2)")
    # For use w/o 'bc' --In-Progress
    #+Doesn't pass $1 or $number1 --hardcoding works
    #quotient=$(awk 'BEGIN {print $number1 / 5 }')
}


###
### MOD
###
SetMod() {
    let remainder=($1 % $2)
}

###
###
###
SetNumbers() {
    read -p "Enter first number : " number1
    read -p "Enter second number: " number2
}
###
### MPY
###
SetMpy() {
    let product=($1 * $2)
}

###
### SUB
###
SetSub() {
    let difference=($1 - $2)
}

###
### Main
###
main() {
    while true
    do
        Prgm_title
        SetChoice
        Perform $choice
    done
}

###
### Run Program
###
main


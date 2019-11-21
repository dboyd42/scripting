#!/bin/bash
# Copyright 2019 David Boyd, all rights reserved
# Program: Signal Processing
# Description:
#
# Date: Thu Nov 21 2019
# Revised:
#   <revision date>
# Reference:
#   http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_12_02.html

clear
# trap interrupt
trap '' 1 2 3 9 15 20

Age=88
#clear

echo -n "Please enter Grandma's age: "
read Guess

while [[ $Guess -ne $Age ]]
do
    echo "Wrong guess"
    echo "Please try again"
    echo "Please enter Grandma's age: "
    read Guess
done

echo "Congratulations!"
echo "user gets Candy"


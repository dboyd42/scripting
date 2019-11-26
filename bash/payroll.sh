#!/bin/bash
# Copyright 2019 David Boyd, all rights reserved
# Program: Payroll
# Description:
#     Calculates payroll with overtime.
# Date: Nov 26 2019
# Revised:
#     <revision date>

###
### Variables
###
Name=()
nEmployees=0
PayRate=()
Hours=()
Gross=()
FTHours=40
OTPayRate=1.5

# expr is for whole numbers
# echo is for floating point numbers

read -p "Enter the number of employees: " nEmployees
for ((i=0; i<nEmployees; i++))
do
    read -p "Enter employee $i's name: " emp
    Name[$i]=$emp
    read -p "Enter $emp's pay rate: " pay
    PayRate[$i]=$pay
    read -p "Hours worked for $emp: " hrs
    Hours[$i]=$hrs

    ### calculate pay
    if [ ${Hours[$i]} -gt $FTHours ]
    then
        tempOThrs=$(( $FTHours * ${PayRate[$i]} ))
        overtimehours=$(( ${Hours[$i]} - $FTHours ))
        overtimePay=$( bc <<< "scale=2; $overtimehours * $OTPayRate * ${PayRate[$i]}" )
        regularPay=$(( ${PayRate[$i]} * $FTHours ))
        Gross[$i]=$( bc <<< "scale=2; $regularPay + $overtimePay" )
    else
        Gross[$i]=$(bc <<< "scale=2; ${Hours[$i]} * ${PayRate[$i]}" )
    fi
done

### display totals
for ((i=0; i<nEmployees; i++))
do
    echo "${Name[$i]}'s total pay = \$${Gross[$i]}"
done


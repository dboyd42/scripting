#!/bin/bash
# Copyright 2019 David Boyd, all rights reserved
# Program: Payroll
# Description:
#     Calculates payroll with overtime.
# Date: Nov 26 2019
# Revised:
#     <revision date>

###
### Declare Variables
###
Name=()         # employee names
nEmployees=0    # number of employees
Wages=()        # employee's wage
HoursWorked=()  # employee's number of hours worked
Gross=()        # employee's total pay
FTHours=40      # num of hours/wk for a full time
OTWages=1.5     # rate of overtime wages

###
### Check Valid Num Employees
###
Check_nEmp() {
    if [ $nEmployees -lt 1 ]
    then
        echo -e "\nInvalid numbers of employees"
        echo "Exiting program..."
        exit 0
    fi
}

###
### Get Employee Information
###
SetEmployee() {
    # Get num of employees
    read -p "Enter the number of employees: " nEmployees
    Check_nEmp
    echo

    # Get Emp name and pay rate
    for ((i=0; i<nEmployees; i++))
    do
        read -p "Employee name: " Name[$i]
        read -p "${Name[$i]}'s pay rate: $" Wages[$i]
        echo
    done
}

###
### Get Hours Worked
###
SetHoursWorked() {
    for ((i=0; i<nEmployees; i++))
    do
        read -p "Hours worked for ${Name[$i]}: " HoursWorked[$i]
    done
}


###
### Calculate Pay
###
CalculatePay() {
    for ((i=0; i<nEmployees; i++))
    do
        if [ ${HoursWorked[$i]} -gt $FTHours ]
        then
            nOTHours=$(( ${HoursWorked[$i]} - $FTHours ))
            OT_Amt=$( bc <<< "scale=2; $nOTHours * $OTWages * ${Wages[$i]}" )
            RegularPay=$( bc <<< "scale=2; ${Wages[$i]} * $FTHours" )
            Gross[$i]=$( bc <<< "scale=2; $RegularPay + $OT_Amt" )
        else
            Gross[$i]=$(bc <<< "scale=2; ${HoursWorked[$i]} * ${Wages[$i]}" )
        fi
    done
}

###
### Display Gross of Employees
###
DisplayGross() {
    echo "Payroll Report"
    echo "======================="
    echo "Name        | Pay"
    echo "-----------------------"
    for ((i=0; i<nEmployees; i++))
    do
        printf "%-12s| $%.2f\n" "${Name[$i]}" ${Gross[$i]}
    done
}

###
### Main
###
main() {
    SetEmployee
    SetHoursWorked
    CalculatePay
    echo
    DisplayGross
}

###
### Run Program
###
main
exit 0


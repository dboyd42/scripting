#!/bin/bash
# Copyright 2019 David Boyd, all rights reserved
# Program: Timeclock Management
# Description:
#     This program manages time-in and time-outroutines for an employee.
#     The program outputs the total hours worked for that day.
# Date: 2019-11-05
# Revised:
#     2019-11-06

###
### Declare vars
###
mphr=60           # Minutes per hour.
hpd=24            # Hours per day.
menu=(Time-In Lunch-Out Lunch-In Time-Out)
punchStrTimes=()  # str [timeIn, lunchOut, lunchIn, timeOut]
punchedHours=()   # int [timeIn, lunchOut, lunchIn, timeOut]
punchedMins=()    # int [timeIn, lunchOut, lunchIn, timeOut]
sumHours=()       # int [beforeLuch, aferLunch]
sumMins=()        # int [beforeLuch, aferLunch]
workedHours=0     # total hours worked
workedMins=0      # total mins worked
minsDaytime=""    # str "mins+daytime" (am or pm)
complement=0      # int paid clocked-in-time
punchStrTimes=(6:30am 11:25am 11:40am 5:50pm)  # Tester vars1
#punchStrTimes=(6:10am 11:50am 11:40am 5:30pm)  # Tester vars2

###
### Program Title
###
prgm_title() {
    echo "==================================================================="
    echo "|                     Timeclock Management                        |"
    echo "==================================================================="
}
###
### Instructions
###
instructions() {
    for i in 5
    do
        echo -e "\n"
    done
    prgm_title
    echo -e "\nInstructions:"
    echo -e "-------------\n"
    echo "1) The format requires a colon ':' to separate hours from minutes"
    echo "2) The time of day must be explicit to 'am' or 'pm'"
    echo ""
    read -p "Press Enter to Continue..."
    (clear)
    prgm_title
    echo -e "Enter time with following format: 5:00pm\n"
}
###
### Get user input
###
getPunchTimes() {
    for ((i=0; i<${#menu[@]}; i++)) {
        printf "%-9s: " ${menu[$i]}
        read punchStrTimes[$i]
    }
}

###
### Parse Hours, Mins, Daytime
###
parsePunchStrTimes() {
    for ((i=0; i<${#punchStrTimes[@]}; i++))
    do
        # Parse using ':'
        punchedHours+=(${punchStrTimes[$i]%%:*})
        minsDaytime=(${punchStrTimes[$i]##*:})

        # Parse minsDaytime using 'a' or 'p'
        if [[ $minsDaytime = *"a"* ]]; then
            punchedMins+=(${minsDaytime%%a*})

        elif [[ $minsDaytime = *"p"* ]]; then
            punchedMins+=(${minsDaytime%%p*})

            # Convert to military time
            punchedHours[$i]=$((punchedHours[$i] + 12))

        else
            punchedMins+=$((minsDaytime))
        fi
    done
}

###
### Calulate hours worked
###
calcHours() {
    for ((i=0; i<${#punchStrTimes[@]}; i+=2)) {
        let sumHours[$i/2]=(punchedHours[$i+1]-punchedHours[$i])
    }
}

###
### Calulate mins worked
###
calcMins() {
    for ((i=0; i<${#punchStrTimes[@]}; i+=2)) {
        # punch-In's minutes complement
        let complement=mphr-punchedMins[$i]
        # Add compliment to punch-Out's minutes
        let sumMins[$i/2]=complement+punchedMins[$i+1]

        # Convert ints to mins
        if [ ${sumMins[$i/2]} -lt $mphr ]
        then
            let sumHours[$i/2]--
        else
            let sumMins[$i/2]=sumMins[$i/2]%mphr
        fi
    }
}

###
### Sum pre & post lunch HH:MM
###
sumTimes() {

    for ((i=0; i<${#punchStrTimes[@]}; i+=2)) {
        let workedHours+=sumHours[$i]+sumHours[i+1]
        let workedMins+=sumMins[$i]+sumMins[i+1]
    }

    # validate mins
    if [ $workedMins -gt $mphr ]
    then
        let workedHours++
        let workedMins-=mphr
    fi

}

###
### Display results
###
displayResults() {
    #clear
    #prgm_title
    echo ""
    for ((i=0; i<${#punchStrTimes[@]}; i++)) {
        printf "%-9s: %7s\n" ${menu[$i]} ${punchStrTimes[$i]}
    }
    echo "=================="
    printf "Total    : %s:%s\n\n" $workedHours $workedMins
}

debug() {
    echo ""
    echo "punchStrTimes: " ${punchStrTimes[*]}
    echo ""
    echo "punchedHours : " ${punchedHours[*]}
    echo "punchedMins  : " ${punchedMins[*]}
    echo ""
    echo "sumHours     : " ${sumHours[*]}
    echo "sumMins      : " ${sumMins[*]}
    echo "workedHours  : " $workedHours
    echo "workedMins   : " $workedMins
    echo "Total Time   : " $workedHours":"$workedMins
    echo ""
}
###
### Main
###
main() {
#    instructions
#    getPunchTimes
    echo "                                                  1ST "
    debug
    parsePunchStrTimes
    calcHours
    echo "                                         2nd post-calcHours()"
    debug
    calcMins
    echo "                                         3rd post-calcMins()"
    debug
    sumTimes
    echo "                                         4th post-sumTimes()"
    debug
    displayResults
    echo "                                                   LAST "
    debug
}

###
### Run Program
###
main

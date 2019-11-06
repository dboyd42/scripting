#!/bin/bash
# Copyright 2019 David Boyd, all rights reserved
# Program: Timeclock Management
# Description:
#     This program manages time in and out routines for a small day care.
#     Outputs the total hours worked that day.
# Date: 2019-11-05
# Revised:
#     <revision date>

###
### Declare vars
###
mphr=60           # Minutes per hour.
hpd=24            # Hours per day.
punchStrTimes=()  # str [timeIn, lunchOut, lunchIn, timeOut]
punchedHours=()   # int [timeIn, lunchOut, lunchIn, timeOut]
punchedMins=()    # int [timeIn, lunchOut, lunchIn, timeOut]
sumHours=()       # int [beforeLuch, aferLunch]
sumMins=()        # int [beforeLuch, aferLunch]
workedHours=0     # total hours worked
workedMins=0      # total mins worked
minsDaytime=""    # str "mins+daytime" (am or pm)
complement=0      # int paid clocked-in-time

###
### Get user input
###
punchStrTimes=(6:30am 11:25am 11:40am 5:30pm)  # hardcoded to be deleted later
#punchStrTimes=(6:10am 11:50am 11:40am 5:30pm)  # hardcoded to be deleted later
#read -p "Time-In  : " punchStrTimes[0]        # THIS WORKS!
#read -p "Lunch-Out: " punchStrTimes[1]
#read -p "Lunch-In : " punchStrTimes[2]
#read -p "Time-Out : " punchStrTimes[3]

###
### Parse Hours, Mins, Daytime
###
parsePunchStrTimes() {
    for (( i=0; i<${#punchStrTimes[@]}; i++))
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
        if [[ $sumMins -lt $mphr ]]
        then
            let sumHours[$i/2]--
        else
            let sumMins[$i/2]=sumMins[$i/2]%mphr
        fi
    }
}

###
### Sum calculated hours and mins
###
sumTimes() {

    for ((i=0; i<${#punchStrTimes[@]}; i+=2)) {
        let workedHours+=sumHours[$i]+sumHours[i+1]
        let workedMins+=sumMins[$i]+sumMins[i+1]
    }

    # validate mins
    if [ $workedMins -gt $mphr ]
    then
        echo ''
        let workedHours++
        let workedMins-=mphr
    fi

}

###
### Display user input
###
display() {
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
    parsePunchStrTimes
    calcHours
    calcMins
    sumTimes
    display
}

###
### Run Program
###
main


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
    let sumHours+=(punchedHours[1]-punchedHours[0])
    #let sumHours+=(punchedHours[3]-punchedHours[2])
    ###########################################################################
    echo ""
    echo "DEBUG :: sumHours   : " ${sumHours[*]}
    ###########################################################################
}

###
### Calulate mins worked
###
calcMins() {
    # punch-In's minutes complement
    let complement=mphr-punchedMins[0]
    # Add compliment to punch-Out's minutes
    let sumMins+=complement+punchedMins[1]
    ###########################################################################
    echo "DEBUG :: sumMins    : " ${sumMins[*]}
    ###########################################################################

    ###
    ### Convert ints to mins
    ###

    if [[ $sumMins -lt $mphr ]]
    then
        let sumHours[0]--
    else
        let sumMins[0]=sumMins[0]%mphr
    fi
    ###########################################################################
    echo "DEBUG :: sumHours   : " ${sumHours[*]}
    echo "DEBUG :: sumMins    : " ${sumMins[*]}
    ###########################################################################
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
    echo "complement   : " $complement
    echo ""
    echo "sumHours     : " ${sumHours[*]}
    echo "sumMins      : " ${sumMins[*]}
    echo "workedMins   : " $workedMins
    echo "workedHours  : " $workedHours
    echo ""
}
###############****************************************************************
# Test Functions
parsePunchStrTimes
calcHours
calcMins
display
###############****************************************************************

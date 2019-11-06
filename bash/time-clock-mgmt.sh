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
daytime=""        # str "am" -or "pm"
complement=0      # int paid clocked-in-time

###
### Get user input
###
punchStrTimes=(6:30am 11:25am 11:40am 5:30pm)  # hardcoded to be deleted later
#read -p "Time-In  : " punchStrTimes[0]        # THIS WORKS!
#read -p "Lunch-Out: " punchStrTimes[1]
#read -p "Lunch-In : " punchStrTimes[2]
#read -p "Time-Out : " punchStrTimes[3]

###
### Parse Hours, Mins, Daytime
###
for (( i=0; i<${#punchStrTimes[@]}; i++))
do
    punchedHours+=(${punchStrTimes[$i]%%:*})
    minsDaytime=(${punchStrTimes[$i]##*:})

    # Parse Mins from am/pm
    if [[ $minsDaytime = *"a"* ]]; then
        punchedMins+=(${minsDaytime%%a*})
    elif [[ $minsDaytime = *"p"* ]]; then
        punchedMins+=(${minsDaytime%%p*})
        punchedHours[$i]=$((punchedHours[$i] + 12))  # Convert to military time
    else
        punchedMins+=$((minsDaytime))
    fi
done

###
### Calulate hours worked
###
let sumHours+=(punchedHours[1]-punchedHours[0])
#let sumHours+=(punchedHours[3]-punchedHours[2])

###############################################################################
echo ""
echo "DEBUG :: sumHours: " ${sumHours[*]}
###############################################################################

###
### Calulate mins worked
###

# time-in's (Minute's) complement
let complement=mphr-punchedMins[0]
# Add compliment to time-out
let tempTotMins=complement+punchedMins[1]
#let sumMins+=tempTotMins%mphr

#if [ $((tempTotMins-mphr)) -gt 0 ]; then
#    let workedHours+=tempTotMins-60
#fi
###############################################################################
echo ""
echo "DEBUG :: sumMins: " ${tempTotMins[*]}
###############################################################################

###
### Convert ints to mins
###

#if [[ totalMin -lt mphr ]]
#then
#    sum
#




###
### Display user input
###
echo ""
echo "punchStrTimes: " ${punchStrTimes[*]}
echo ""
echo "punchedHours : " ${punchedHours[*]}
echo "punchedMins  : " ${punchedMins[*]}
echo ""
echo "complement   : " $complement
echo "tempTotMins  : " $tempTotMins
echo "workedMins   : " $workedMins
echo "workedHours  : " $workedHours
echo ""


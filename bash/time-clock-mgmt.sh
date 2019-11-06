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
mphr=60       # Minutes per hour.
hpd=24        # Hours per day.

times=() # str [timeIn, lunchOut, lunchIn, timeOut]
hours=() # int [timeIn, lunchOut, lunchIn, timeOut]
mins=()  # int [timeIn, lunchOut, lunchIn, timeOut]
minsDaytime=""  # str "mins+daytime"
daytime=""      # str "am" -or "pm"
complement=0
totalMins=0
totalHours=0
paidMins=0
paidHours=0

###
### Get user input
###
times=(6:30am 11:25am 11:40am 5:30pm)  # hardcoded to be deleted later
#read -p "Time-In  : " times[0]        # THIS WORKS!
#read -p "Lunch-Out: " times[1]
#read -p "Lunch-In : " times[2]
#read -p "Time-Out : " times[3]

###
### Calculate H:M worked
###

### Parse Hours, Mins, Daytime
for (( i=0; i<${#times[@]}; i++))
do
    hours+=(${times[$i]%%:*})
    minsDaytime=(${times[$i]##*:})

    # Parse Mins from am/pm
    if [[ $minsDaytime = *"a"* ]]; then
        mins+=(${minsDaytime%%a*})
    elif [[ $minsDaytime = *"p"* ]]; then
        mins+=(${minsDaytime%%p*})
        hours[$i]=$((hours[$i] + 12))  # Convert to military time
    else
        mins+=$((minsDaytime))
    fi
done

###
### Calulate mins worked
###
let complement=mphr-mins[0]        # 60's complement
let totalMins=complement+mins[1]
let paidMins+=totalMins%mphr

if [ $((totalMins-mphr)) -gt 0 ]; then
    let paidHours+=totalMins-60
fi

###
### Calulate hours worked
###

let totalHours=(hours[1]-hours[0])
let totalHours+=(hours[3]-hours[2])



###
### Display user input
###
echo ""
echo "Times: " ${times[*]}
echo "hours: " ${hours[*]}
echo "mins : " ${mins[*]}
echo ""
echo "complement: " $complement
echo "totalMins : " $totalMins
echo "paidMins  : " $paidMins
echo "paidHours : " $paidHours
echo ""


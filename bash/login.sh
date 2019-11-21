#!/bin/bash
# Copyright 2019 David Boyd, all rights reserved
# Program: Login Script
# Description:
#     This script demonstrates a login script.
# Date: Thu Nov 21 2019
# Revised:
#     <revision date>

# case statement

#daysOfWeek=(Sunday Monday Tuesday Wednesday Thursday Friday Saturday)

# Begin Program
clear
echo -n "Login "
read name

# Collecting SYSTEM DATE
date '+%A, %B, %d'

case "$(date '+%w')" in
    1)
        echo "Work only M-F.  Enjoy your weekend"
        ;;
    2)
        echo "Welcome to Monday funday"
        ;;
    3)
        echo "Family Day"
        ;;
    4)
        echo "Mandatory Meeting for all Insurance Vendors at 2:00pm"
        ;;
    5)
        echo "Backups are to be done between 3pm and 5pm"
        ;;
    6)
        echo "It's Friday.  You don't have to go home, but you can't stay here"
        ;;
    7)
        echo "Work only M-F.  Enjoy your weekend"
        ;;
    *)
        echo "You shouldn't be here!"
        ;;
esac


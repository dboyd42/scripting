#!/bin/bash
# Copyright 2019 David Boyd, all rights reserved
# Program: Search
# Description:
#   Searches inside pdf and txt files using grep and greppdf
#   Modified for copy and paste patterns from system clipboard to bash
# How to Run:
#   run from shell with or without pattern arguments
#       $ ./search.sh
#       $ ./search.sh search for these words
#       # if using system clipbaord in shell: <C-S-v>
#       $ ./search./ <C-S-v>
#   continue to use <C-S-v> for each new entry
# Note:
#   This script allows regex search using the backslash '\' prefix
# Date: Mon 04 Nov 2019
# Revised:
#     <revision date>

# Get vars
str=""
lines=3     # prints nlines before & after grep'd pattern

# Determine if args have been passed
if [ -z $1 ]; then
    # get next input
    echo -e "\nUse Ctrl+C to exit program"
    echo -e "--------------------------\n"
    read -p "Enter search string: " str
else
    str="$*"
fi

# Search files
while :
do
    clear
    echo  "======================================="
    echo  "Searching for: \"$str\""
    echo  "======================================="

    # PDF search
    echo -e "\npdf results ..."
    echo -e "--------------------\n"
    pdfgrep "$str" *.pdf -i -B $lines -A $lines

    # files search
    echo -e "\nother files results ..."
    echo -e "-------------------------\n"
    grep "$str" ./* -rHin -B $lines -A $lines

    # get next input
    echo -e "\n===================================="
    echo "Ctrl+C to exit program"
    echo "Ctrl-Shift-v to paste from clipboard"
    echo "===================================="
    read -p "Enter next search string: " str
done


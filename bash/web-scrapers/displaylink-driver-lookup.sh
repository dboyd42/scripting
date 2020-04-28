#!/bin/bash
# Copyright 2020 David Boyd, all rights reserved
# Program: displaylink-driver.sh
# Description:
#     Checks for DisplayLink's driver update for Ubuntu 20.4
# Date: 2020-04-28
# Revised:

URL="https://www.displaylink.com/downloads/ubuntu"
version="Ubuntu 20.04"
found=$(curl -s $URL | grep -oh -m1 "$version" ) # -'s'ilent curl's headers

if [[ "$found" == "$version" ]]; then
    echo "DisplayLink driver for $version is now available for download:"
    echo -e "\t$URL"
else
    echo "DisplayLink driver for $version is NOT available."
fi


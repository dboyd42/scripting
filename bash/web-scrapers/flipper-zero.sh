#!/bin/bash
# Copyright 2020 David Boyd, all rights reserved
# Program: displaylink-driver.sh
# Description:
#     Checks for Flipper Zero's availability in US.
# Date: 2023-01-12

URL="https://shop.flipperzero.one/"
availability="Sold out"
found=$(curl -s $URL | grep -oh -v "$availability" ) # -'s'ilent curl's headers

if [[ "$found" == "$availability" ]]; then
    echo "Flipper Zero IS AVAILABLE at $URL"
    echo -e "\t$URL"
    firefox $URL &
else
    echo "Flipper Zero is still $availability at $URL #fml"
fi


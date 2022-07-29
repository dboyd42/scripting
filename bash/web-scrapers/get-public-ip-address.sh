#!/bin/bash
# Copyright 2022 David Boyd, all rights reserved
# Program: Get Public IP Address
# Description:
#     This prgm access WhatIsMyPublicIP.com and extracts your public IP address.
# Date: 2022-07-29
# Revised:

curl https://www.whatismypublicip.com 2>&1 | \
grep -oE "([[:digit:]]{1,3}\.){3}[[:digit:]]{1,3}"

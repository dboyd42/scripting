#!/usr/bin/env python3
# Copyright 2022 David Boyd, all rights reserved
# Program: re_domains.py
# Description:
#     Outputs domain names from a file.
# Date: 2022-05-18
# Revised:

from sys import argv
import re

# Validate CLI parameters
if (len(argv) != 2):
    print("Usage: python get_domains.py <filename>")
    exit()

# Get domain names from file
# grep -Eion "(([[:alnum:]]+.\)+([[:alnum:]]+))" <filename>
pattern = re.compile(r'/+?((?:\w+\.)+\w+)')

# Extract domains from file
try:
    with open(argv[1], 'r') as inFile:
        print(pattern.findall(inFile.read()))
except FileNotFoundError:
    print("Usage: python get_domains.py <filename>")
    print("File not found.")

if "__name__" == "__main__":
    pass


#!/usr/bin/env python3
# Copyright 2022 David Boyd, all rights reserved
# Program: hash_ntlmv2.py
# Description:
#     Generates a random number of IP addresses.
# Date: 2022-08-18
# Revised:

from sys import argv
from random import randint

if len(argv) < 2:
    print("[ERR]\tPlease provide number of IP addresses to generate.")
    exit()

nIPs = int(argv[1])

for idx in range(nIPs):
    for octect in range(3):
        octect = str(randint(0,255))
        print(octect + ".", sep='', end='')
    print(str(randint(0,255)))


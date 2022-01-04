#!/usr/bin/env python3
# Copyright 2022 David Boyd, all rights reserved
# Program: hash_ntlmv2_simple.py
# Description:
#     Generates an NTLMv2 hash
#       Uses the MD4 hash algorithm
#       Matches NTLMv2's encoding
# Date: 2022-01-03
# Revised:
import hashlib, sys, getopt

if (len(sys.argv) != 3):
    print("[USAGE] ./hash_ntlmv2_simple.py <inputFile> <outputFile>")
    sys.exit(2)

with open(sys.argv[1]) as f:
    for line in f:
        line = line.strip()
        with open(sys.argv[2], 'a+') as o:
            o.write(hashlib.new('md4', \
                    line.encode('utf-16le')).hexdigest().upper()+'\n')


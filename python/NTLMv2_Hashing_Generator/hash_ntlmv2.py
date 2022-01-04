#!/usr/bin/env python3
# Copyright 2022 David Boyd, all rights reserved
# Program: hash_ntlmv2.py
# Description:
#     Generates an NTLMv2 hash
#       Uses the MD4 hash algorithm
#       Matches NTLMv2's encoding
# Date: 2022-01-03
# Revised:
import hashlib, sys, getopt

if (len(sys.argv[1:]) != 4):
    print("[USAGE] hash_ntlmv2.py -i <inputFile> -o <outputFile>")
    sys.exit(2)
argv = sys.argv[1:]

opts, args = getopt.getopt(argv, "i:o:")
for opt, arg in opts:
    if (opt == '-i'):
        inFile = arg
    elif (opt == '-o'):
        outFile = arg
with open(inFile) as f:
    for line in f:
        line = line.strip()
        with open(outFile, 'a+') as o:
            o.write(hashlib.new('md4', \
                    line.encode('utf-16le')).hexdigest().upper()+'\n')


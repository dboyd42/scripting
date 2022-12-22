#!/bin/bash
# Copyright 2022 David Boyd, all rights reserved
# Program: Convert Encoding
# Description:
#    Converts a string between different encodings.
#        Available Encodings: ASCII, Bin, Dec, Hex, UTF-8
# Date: 2022-12-22
# Revised:
#
#
# Issues: 
#   1. ASCII has prepended whitespace
#   2. Binary is a repetive sequence of \x20 (spaces) and inaccurate 0b numbers
#   3. UTF-8 needs non-ASCII chars stipped.
#
# Investigations:
#   1. Test on other platforms (curr=APFS on m1)

ascii_str=$(echo -n "$1" | od -An -t x1)
#binary_str=$(echo -n "$1" | od -An -t x1 | xxd -b -p | tr -d ' \n')
decimal_str=$(echo -n "$1" | od -An -t d1 | tr -d ' \n')
hex_str=$(echo -n "$1" | od -An -t x1 | tr -d ' \n')
#utf8_str=$(echo -n "$1" | od -An -t x1 | xxd -p -r)

# Print the results
echo "ASCII: $ascii_str"
#echo "Binary: $binary_str"
echo "Decimal: $decimal_str"
echo "Hex: $hex_str"
#echo "UTF-8: $utf8_str"


#/usr/bin/python3
# Copyright 2022 David Boyd, all rights reserved
# Program: Convert Encoding
# Description:
#    Converts a string between different encodings.
#        Available Encodings: ASCII, Bin, Dec, Hex, UTF-8
# Date: 2022-12-22

import argparse
import re

###
### Convert Encoding()
###
def convert_encoding(input_str:str, input_format:str)->dict:

    # Convert the input string to bytes using the specified input format
    try:
        if input_format == 'ASCII':
            input_bytes = input_str.encode('ascii')
        elif input_format == 'Binary':
            input_bytes = bytes(int(input_str, 2))
        elif input_format == 'Decimal':
            input_bytes = bytes(int(input_str))
        elif input_format == 'Hex':
            input_bytes = bytes.fromhex(input_str)
        elif input_format == 'UTF-8':
            input_bytes = input_str.encode('utf-8')
        else:
            raise ValueError('Invalid input format')

    except ValueError as e:
        print(f'\nError: {e}')
        print('\nYou need to correctly identify the input string\'s format.')
        print('  [Example 1]\n    $ python3 encoder.py -a "Hello, world"')
        print('  [Example 2]\n    $ python3 encoder.py --hex 4869')
        print('\nExiting...\n')
        exit()

    # Convert the bytes to the output formats
    try:
        ascii_str = input_bytes.decode('ascii')
    except UnicodeDecodeError as e:
        # Remove all non-ASCII chars from the input string
        ascii_str = re.sub(b'\[\x00-\x7F\]', '', input_bytes)

    bin_str = ''.join(format(b, '08b') for b in input_bytes)
    dec_str = ' '.join(str(b) for b in input_bytes)
    hex_str = input_bytes.hex()
    utf8_str = input_bytes.decode('utf-8')

    # Return output formats as a dictionary
    return { 'input_str':input_str, 'input_format':input_format, \
             'ASCII':ascii_str, 'Binary':bin_str, 'Decimal':dec_str, \
             'Hex':hex_str, 'UTF-8':utf8_str }

###
### Parse Args
###
def parse_args()->object:

    # Parse the command line arguments
    parser = argparse.ArgumentParser( \
        description='Convert a string between different encodings.')
    parser.add_argument('input_str', type=str, default='ASCII',\
        help='The input string to be converted.')

    # Setup a mutally exclusive group of flags
    group = parser.add_mutually_exclusive_group()
    group.add_argument('-a', '--ascii', action='store_const', const='ASCII', \
        dest='input_format', help='Set the input format to ASCII.')
    group.add_argument('-b', '--binary', action='store_const', const='Binary', \
        dest='input_format', help='Set the input format to Binary.')
    group.add_argument('-d', '--decimal', action='store_const', const='Decimal', \
        dest='input_format', help='Set the input format to Decimal.')
    group.add_argument('-x', '--hex', action='store_const', const='Hex', \
        dest='input_format', help='Set the input format to Hex.')
    group.add_argument('-u', '--utf-8', action='store_const', const='UTF-8', \
        dest='input_format', help='Set the input format to UTF-8.')

    return parser.parse_args()

###
### Print Encodings
###
def print_encodings(encodings:dict)->None:
    col2_len = len(encodings.get('Binary')) + 2

    print('+', '='*9, '+', '='*col2_len, sep='')
    print(f'| String  | {encodings.get("input_str")}')
    print(f'| Format  | {encodings.get("input_format")}')
    print('+', '-'*9, '+', '-'*col2_len, sep='')
    print(f'|   ASCII | {encodings.get("ASCII")}')
    print(f'|  Binary | {encodings.get("Binary")}')
    print(f'| Decimal | {encodings.get("Decimal")}')
    print(f'|     Hex | {encodings.get("Hex")}')
    print(f'|   UTF-8 | {encodings.get("UTF-8")}')
    print('+', '='*9, '+', '='*col2_len, sep='')

    if encodings.get('input_format') == 'UTF-8':
        print('Note: The ASCII value has been stripped of any chars that ' \
              + 'are not part of the\n      ordinal range between 0-127.')

###
### main()
###
def main():
    args = parse_args()
    encodings = convert_encoding(args.input_str, args.input_format)
    print_encodings(encodings)

if __name__ == "__main__":
    main()


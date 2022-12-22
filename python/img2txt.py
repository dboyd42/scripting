#!/usr/bin/python3
# Copyright 2022 David Boyd, all rights reserved
# Program: Image 2 Text
# Description:
#    Extract text from an image.
# Date: 2022-12-22

from sys import argv
from ntpath import basename
from PIL import Image
import pytesseract


# Open the image
try:
    image_path = argv[1]
    image = Image.open(image_path)
except FileNotFoundError as e:
    print(f'Error: {e}')
    print('Exiting...\n')
    exit()

image_name = basename(image_path)

# Extract the text
text = pytesseract.image_to_string(image)

# Output the text to a file
with open(image_name + '.txt', 'w') as f:
    f.write(text)


print('\n' + text)
print('\nText written to: ' + image_name + '.txt\n')


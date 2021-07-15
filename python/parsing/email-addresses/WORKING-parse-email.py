#!/usr/bin/env python3
# Copyright 2021 David Boyd, all rights reserved
# Program: parse-email-addr.py
# Dependencies: pyperclip
# Description:
#     Parses copied email addresses leaving only the user@domain.tld address.
# Date: 2021-07-14
# Revised:

import pyperclip
clipboard_list = []
email_list = []

###
### Input contents of clipbard into list
###
# Sep all words to isolate email addresses
clipboard_list = pyperclip.paste().split(" ")

###
### Parse contents
###
for word in clipboard_list:
    # Find email addresses with the '@' symbol
    if ("@" in word):
        # Check if word has tags `<>`
        if ("<" in word and ">" in word):
            # Remove tags from last word
            if (word == clipboard_list[-1]):
                word = word[1:-1]
            # Remove tags and keep comma
            else:
                word = word[1:-2] + word[-1]
        # Append to email list
        email_list.append(word)

###
### Output email addresses to clipboard
###
def list_to_clipboard(output_list):
    # Check if len(list) > 0, then copy to clipboard
    if len(output_list) > 0:
        pyperclip.copy(' '.join(output_list))
        print("Copied to clipboard: ")
    else:
        pyperclip.copy("There was nothing on the clipboard")

# Copy contents to clipboard
list_to_clipboard(email_list)


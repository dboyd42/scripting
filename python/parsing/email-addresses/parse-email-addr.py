#!/usr/bin/env python3
# Copyright 2021 David Boyd, all rights reserved
# Program: parse-email-addr.py
# Dependencies: pyperclip
# Description:
#     Parses copied email addresses leaving only the user@domain.tld address.
# Date: 2021-07-14
# Revised:

import pyperclip
###
### Global Variables
###   - so sue me!
clipboard_list = []

###
### get_clipboard(string)
###     params: string; calls: none; returns string;
def get_clipboard(delim):
    """Returns contents from the clipboard into a list.

    Keyword arguments:
    delim -- a delimeter to separate the contents
    """
    return pyperclip.paste().split(delim)

###
### parse_contents(list)
###     params: list; calls: clean_email; returns list
def parse_contents(contents):
    """Finds the user@domain.tld strings in a list.

    Keyword arguments:
    contents -- a list of email adresses
    """
    # Find email addresses with the '@' symbol
    email_list = []
    for word in contents:
        if "@" in word:
            email_list.append(clean_email(word, contents))
    return email_list

###
### clean_email(string, list)
###  params: string, list; calls: none; returns string
def clean_email(email_address, contents):
    """ Slice tags from an email address.

    Keyword arguments:
    email -- a string
    """
    # Check if word has tags `<>`
    if ("<" in email_address and ">" in email_address):
        # Remove tags from last email_address
        if (email_address == contents[-1]):
            email_address = email_address[1:-1]
        # Remove tags and keep comma
        else:
            email_address = email_address[1:-2] + email_address[-1]
    # Return to parse_contents()
    return email_address

###
### list_to_clipboard(list)
###  params: list; calls none; returns list of strings;
def list_to_clipboard(output_list):
    """ Takes a list of strings and copies them to the Clipboard.

    Keyword aguments:
    output_list -- a list of strings
    """
    # Check if len(list) > 0, then copy to clipboard
    if len(output_list) > 0:
        pyperclip.copy(' '.join(output_list))
        print('Copied to clipboard: ')
    else:
        pyperclip.copy("There was nothing on the clipboard")

###
### main()
###
def main():

    delimeter = ' '

    # Paste clipboard contents into list
    clipboard_list = get_clipboard(delimeter)

    # Parse contents
    email_addresses = parse_contents(clipboard_list)

    # Copy contents to clipboard
    list_to_clipboard(email_addresses)

###
### Run main() prgm
###
if __name__ == "__main__":
    main()


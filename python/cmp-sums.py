#!/usr/bin/env python3
# Copyright 2019 David Boyd, all rights reserved
# Program: Compare Checksums
# Description:
#     Compares SHA1sums and MD5sums from system clipboard to file's SHA1sum.
# Date: 2020-01-10
# Revised:
#    2020-01-18 - implemented md5 checksum
# Depencies:
#       macOS: brew install md5sha1sum

import sys          # used for CLI args
import subprocess   # used for terminal commands
import pyperclip    # cp & paste from sys clipboard
from termcolor import colored

# Display warning
#print("Make sure the SHA1 checksum is copied into the your system's clipboard")
#input("Press 'Enter' to continue...")

# Check if two argv have been passed
if (len(sys.argv) != 2):
    print("Try './cmp-sha1.py filename'")
    exit(0)

# Declare local variables
local_file = sys.argv[1]
web_sha1 = pyperclip.paste()
web_md5 = pyperclip.paste()

# Set up the sha1sum cmd and direct the output to a pipe
file_sha1 = subprocess.Popen(['sha1sum', local_file], stdout=subprocess.PIPE)
file_md5 = subprocess.Popen(['md5sum', local_file], stdout=subprocess.PIPE)

# Run the command
outSHA1 = file_sha1.communicate()[0]  # type = bytes
outMD5 = file_sha1.communicate()[0]  # type = bytes
outSHA1 = outSHA1.decode('utf-8')      # type = str
outMD5 = outMD5.decode('utf-8')      # type = str

# Extract SHA1sum
sha1 = outSHA1.split()[0]
md5 = outMD5.split()[0]

# Compare SHA1sums
if (web_sha1 == sha1):
    sha1Status = "Passed"
    sha1Color = "green"
    md5Status = "Passed"
    md5Color = "green"
else:
    sha1Status = "Failed"
    sha1Color = "red"
    md5Status = "Failed"
    md5Color = "red"

# Display Results
print(web_sha1, "\t<--From System Clipboard")
print(sha1, "\t<--From file's SHA1")
print('='*79)
print('SHA1 checksums:', sha1Colored(sha1Status, sha1Color))
print('MD5 checksums:', md5Colored(md5Status, md5Color))



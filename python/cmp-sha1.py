#!/usr/bin/env python3
# Copyright 2019 David Boyd, all rights reserved
# Program: Compare SHA1
# Description:
#     Compares SHA1sums from system clipboard to file's SHA1sum.
# Date: 2020-01-10
# Revised:

import sys          # used for CLI args
import subprocess   # used for terminal commands
import pyperclip    # cp & paste from sys clipboard

# Display warning
#print("Make sure the SHA1 checksum is copied into the your system's clipboard")
#input("Press 'Enter' to continue...")

# Declare local variables
local_file = sys.argv[1]
web_sha1 = pyperclip.paste()

# Set up the sha1sum cmd and direct the output to a pipe
file_sha1 = subprocess.Popen(['sha1sum', local_file], stdout=subprocess.PIPE)

# Run the command
output = file_sha1.communicate()[0]  # type = bytes
output = output.decode('utf-8')      # type = str

# Extract SHA1sum
sha1 = output.split()[0]

# Compare SHA1sums
if (web_sha1 == sha1):
    status = "Passed"
else:
    status = "Failed!"

# Display Results
print(web_sha1, "\t<--From System Clipboard")
print(sha1, "\t<--From file's SHA1")

print('='*79)
print('SHA1 checksums:', status)



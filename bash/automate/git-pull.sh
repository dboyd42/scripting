#!/bin/bash
# Copyright 2019 David Boyd, all rights reserved
# Program: git-pull.sh
# Description:
#     Updates (pulls) and checks the status of repos
#     under a parent directory.
# Date: Dec 29 2019
# Revised:
#    2020-01-12
#    2020-01-10

# Uncomment line below for user input | Requires abs(path/to/dir/)
#read -p "Enter path/to/dir that holds your repos (enter '.' for current): " repo

# Initialize path/to/repo/dirs/
#repo="../../"  # default location
#repo="/home/$USER/Documents/code/repos/github/dboyd42/"  # Linux
repo="/$USER/Documents/code/repos/github/dboyd42/"  # Kali

# cd to directory
cd $repo
echo -e "\nCurrent directory: $PWD"
echo -e "===================================================================\n"

# Update each repo and check status
for dir in ./*/
do
    cd $dir
    echo "$dir"
    git pull
    git status
    echo -e "-----------------------------------------------\n"
    cd ../
done

echo "==================================================================="
echo -e "Pulling completed!\n"


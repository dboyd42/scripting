#!/bin/bash
# Copyright 2019 David Boyd, all rights reserved
# Program: git-pull.sh
# Description:
#     Updates (pulls) and checks the status of repos
#     under a parent directory.
# Date: Dec 29 2019
# Revised:
#    2020-02-10 - fixed kali path
#    2020-01-16
#    2020-01-15
#    2020-01-12
#    2020-01-10

# Determine OS and initialize path/to/repo/dirs/
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)  repoDir="/home/$USER/Documents/code/repos/github/dboyd42/";;
    Darwin*) repoDir="/Users/$USER/Documents/code/repos/github/dboyd42/";;
    *)       repoDir="../../../"  # default location
esac

# Uncomment line below for user input | Requires abs(path/to/dir/)
#read -p "Enter path/to/dir that holds your repos (enter '.' for current): " repo

# cd to directory
cd $repoDir
echo -e "\nCurrent directory: $PWD"
echo -e "===================================================================\n"

# Pull and check status of each repo
for dir in ./*/
do
    cd $dir
    echo "$dir"
    git pull
    git status
    echo -e "-----------------------------------------------\n"
    cd ../
done

# Display end of program
echo "==================================================================="
echo -e "Pulling completed!\n"


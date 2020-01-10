#!/bin/bash
# Copyright 2019 David Boyd, all rights reserved
# Program: git-pull.sh
# Description:
#     Updates (pulls) and checks the status of repos
#     under a parent directory.
# Date: Dec 29 2019
# Revised:
#    2020-01-10
# Note: If making script global:
#           $(cp script /usr/local/bin/)
#           repo="/home/$USER/path/to/repo"

# Declare vars
repo="../../"  # Path from scripting repo

# Uncomment line below for user input
#read -p "Enter path/to/dir that holds your repos (enter '.' for current): " repo

# cd to directory
cd $repo
echo -e "\nCurrent directory: $PWD"
echo -e "===================================================================\n"

# Update each repo
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
echo -e "Pulling complete!\n"


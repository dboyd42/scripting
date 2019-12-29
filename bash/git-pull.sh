#!/bin/bash
# Copyright 2019 David Boyd, all rights reserved
# Program: git-pull.sh
# Description:
#     Updates (pulls) and checks the status of repos
#     under a parent directory.
# Date: Dec 29 2019
# Revised:
#     <revision date>

#read -p "Enter path/to/dir that holds your repos [enter '.' for current]: " repo
#cd $repo
cd ../../
echo -e "\nCurrent directory: $PWD\n"

# update each repo
for dir in ./*/
do
    cd $dir
    echo "$dir"
    git pull
    git status
    echo -e "-----------------------------------------------\n"
    cd ../
done

echo -e "\nCompleted pulling.\n"


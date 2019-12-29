#!/bin/bash
# Copyright 2019 David Boyd, all rights reserved
# Program: git-pull.sh
# Description:
#     Updates all repositories within a given directory.
# Date: Dec 29 2019
# Revised:
#     <revision date>

#read -p "Enter path/to/dir that holds your repos [enter '.' for current]: " repo
#cd $repo
echo -e "Current directory: $PWD\n"

# update each repo
for dir in ./*/
do
    cd $dir && echo "$dir"
    git pull
    cd ../
done

echo -e "Completed pulling.\n"


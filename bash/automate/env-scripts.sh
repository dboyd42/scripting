#!/bin/bash
# Copyright 2019 David Boyd, all rights reserved
# Program: Global Scripts
# Description:
#     Assigns scripts to global $PATH.
# Date: 2020-01-13
# Revised:
#     <revision date>

SCRIPT=""     # SCRIPT's name
#SPATHLIST=()  # Script[s] PATH LIST... if multi $SCRIPT are found
SFINDPATH=""  # Script's `Find` PATH
SABSPATH=""   # Script's ABSolute PATH
GPATH=""      # Global $PATH

# Check for second argument
if [ -z $1 ]
then
    echo "Try './global-scripts.sh scriptname.sh'"
    exit
fi

# Get PATHS
SCRIPT=$1
cd $HOME
SFINDPATH=$(find . -iname $SCRIPT)
SABSPATH=$(readlink -f $SFINDPATH)
GPATH=$(echo $PATH | cut -d ':' -f 2)

# Link $SCRIPT to Global PATH
sudo ln -sf $SABSPATH $GPATH
chmod u+x "${GPATH}/${SCRIPT}"


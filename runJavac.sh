#!/bin/bash
#
# Copyright 2019 David Boyd, all rights reserved
# Program: runJavac.sh
# Description:
#   This script automates the java compile and run process into one command.
#   The java-file can be ran with and without the '.' or '.java' extensions
# Date: Thu Oct 17 16:47:08 CDT 2019
# Revised:
#     <revision date>
#
# (3) Ways to run runJavac.sh:
#   $ ./run Driver.java
#   $ ./run Driver.
#   $ ./run Driver

# Vars
prgmName=$1
ext="java"
dot="."

# rm all class files
rm *.class 2>/dev/null

# Remove string='java'
if [[ $1 == *$ext ]]; then
  prgmName=${1%"java"}
fi

# Cat '.' to $prgmName
if [[ $prgmName != *$dot ]]; then
  prgmName+=${dot}
fi

### Compile Java program
javac "${prgmName}java"

### Run Java program
java ${prgmName%"."}


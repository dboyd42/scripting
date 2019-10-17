#!/bin/bash
#
# This script automates the java compile and run process into one command.
# The <javaFile> can be ran with and without the '.' and '.java' extensions
#
# How to run script: $ ./run javafile

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
  echo "here's the dot"
  prgmName+=${dot}
fi

### Compile Java program
javac "${prgmName}java"

### Run Java program
java ${prgmName%"."}


#!/bin/bash

echo -e "\n"

# hello world
echo "Hello World!"

echo -e "\n"

# environment variables
echo "Hello $USER!"
echo "You are currently here: $PWD"
echo "But you're home directory is here: $HOME"

echo -e "\n"

# If-else conditional
echo "Hello $USER"

if [ $HOME == $PWD ]
then
    echo "Good, you're in your home directory: $HOME"
else
    echo "What are you doing away from home?!?"

    cd $HOME

    echo "Now you are in your home directory: $PWD"
fi

echo -e "\n"

#string
var=adam
if [ $1 = $var ] ; then echo "string $1 equals $var" ; fi
if [ $1 == $var ] ; then echo "string $1 equals $var" ; fi
if [ $1 != $var ] ; then echo "string $1 does not equals $var" ; fi
if [ -z $1 ] ; then echo "string $1 is empty" ; fi
if [ -n $1 ] ; then echo "string $1 is not empty" ; fi

echo -e "\n"

#numeric
a=1
if [ $a -eq $1 ] ; then echo "number $1 equals $a" ; fi
if [ $a -ne $1 ] ; then echo "number $1 does not equals $a" ; fi
if [ $a -gt $1 ] ; then echo "$a greater than $1" ; fi
if [ $a -lt $1 ] ; then echo "$a is less than $1" ; fi

echo -e "\n"

#file/dir properties
if [ -d $1 ] ; then echo "$1 exists and is a directory!" ; fi
if [ -e $1 ] ; then echo "$1 exists" ; fi
if [ -f $1 ] ; then echo "$1 exists and is not a directory!" ; fi
if [ -r $1 ] ; then echo "$1 exists and is a readable!" ; fi
if [ -s $1 ] ; then echo "$1 exists and has size greater than zero" ; fi
if [ -w $1 ] ; then echo "$1 exists and is a writable!" ; fi
if [ -x $1 ] ; then echo "$1 exists and is a executable!" ; fi

echo -e "\n"

# NOTE: Since everything's on the same line, I need ;s between
# the if and the then and between the then and the fi.


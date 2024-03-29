Bash
####
:Author: David Boyd
:Date: Oct 30 2019

This repository holds scripts I've written for previous courses.

Contents
========

+------------------------+-------------------------------------------------------------+
| Program                | Description                                                 |
+========================+=============================================================+
| array-math             | Multiplies two arrays from files; then outputs the square   |
|                        | root of their product to another file                       |
+------------------------+-------------------------------------------------------------+
| avgSum                 | Calculates the average and sum of 10 integers               |
+------------------------+-------------------------------------------------------------+
| conditionals           | Examplifies conditional statements                          |
+------------------------+-------------------------------------------------------------+
| login                  | Examplifies a login script                                  |
+------------------------+-------------------------------------------------------------+
| looping                | Examplifies loops: for / while                              |
+------------------------+-------------------------------------------------------------+
| menu-driven-calculator | Exemplifies a menu driven program that simulates a basic    |
|                        | calculator                                                  |
+------------------------+-------------------------------------------------------------+
| randomnumbers          | Creates an n size array of random numbers with/out a range. |
|                        | Then writes output to a file.                               |
+------------------------+-------------------------------------------------------------+
| runJavac               | An alternative to using a Makefile for compiling and        |
|                        | running Java programs                                       |
+------------------------+-------------------------------------------------------------+
| signal processing      | Traps signals from the keyboard                             |
+------------------------+-------------------------------------------------------------+
| sqr-numbers            | Reads in a file of numbers, squares their values,           |
|                        | then writes output to another file.                         |
+------------------------+-------------------------------------------------------------+
| time clock mgmt        | Calculates hours worked for an employee                     |
+------------------------+-------------------------------------------------------------+

+------------+------------------------------------------+
| Directory  | Description                              |
+============+==========================================+
| datafiles | Files used as input for various programs |
+------------+------------------------------------------+
| output     | Shows sample outputs from programs       |
+------------+------------------------------------------+

Learning Notes
==============

Internal Field Separator
------------------------

**IFS** stands for "*internal field separator*".  It is used by the shell to
determine how to do word spitting.  The default value for IFS consists of
*whitespace* characters including *space, tab,* and *newline*.

.. code-block :: Bash

	# IFSeparates replaces numbers whitespace delimeters ' ' with '+'
	sum=$( IFS="+"; bc <<< "${numbers[*]}" )

Here String
-----------

**<<<** - a *here string* passes the word on the right to the STDIN of the
command on the left.

.. code-block :: Bash

	# Auto loops to feed each value into bc.  Note: IFS prev declared
	sum=$( IFS="+"; bc <<< "${numbers[*]}" )

array[@] vs array[*]
--------------------

When bash parses a command line, it splits it into a series of "words".  Shell
words are separated by ' ' *whitespaces*.

"${array[@]}" leads to each element of the array being treated as a separate
shell word.

"${array[*]}" leads to a *single* shell-word with *all* of the elements of the
array separated by spaces **(or whatever the first chracter of IFS is)**

scale
-----
**scale** determines how many decimal places.

Global Scripts
==============

.. code-block :: Bash

	# Find machine's $PATH, Find current dir
	echo $PATH
	pwd | xclip -selection clipboard

	# Create softlink from repo to $PATH
	sudo ln -sf `xclip -o` /usr/local/bin/
	chmod +x /usr/local/bin/git-pull.sh


Bash
####
:Author: David Boyd
:Date: Wed Oct 30

Contents
========

+--------------+------------------------------------------------------+
| Program      | Description                                          |
+==============+======================================================+
| avgSum       | Calculates the average and sum of 10 integers        |
+--------------+------------------------------------------------------+
| conditionals | Examplifies conditional statments                    |
+--------------+------------------------------------------------------+
| looping      | Examplifies loops: for / while                       |
+--------------+------------------------------------------------------+
| runJavac     | An alternative to using a Makefile for compiling and |
|              | running Java programs                                |
+--------------+------------------------------------------------------+
| search       | Searches <pattern> in files including pdfs           |
+--------------+------------------------------------------------------+
| sqr-numbers  | Reads in a file of numbers, squares their values,    |
|              | then writes output to another file.                  |
+--------------+------------------------------------------------------+
| time clock   | Calculates hours worked for an employee              |
| mgmt         |                                                      |
+--------------+------------------------------------------------------+

+------------+------------------------------------------+
| Directory  | Description                              |
+============+==========================================+
| data-files | Files used as input for various programs |
+------------+------------------------------------------+
| output     | Shows sample outputs from programs       |
+------------+------------------------------------------+

Bash Contents
=============

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


Bash
####
:Author: David Boyd
:Date: Wed Oct 30

Contents
========

+--------------+------------------------------------------+
| Directory    | Description                              |
+==============+==========================================+
| automate     | Scripts used to automate redundant tasks |
+--------------+------------------------------------------+
| datafiles    | Files used as input for various programs |
+--------------+------------------------------------------+
| fundamentals | Scripts written for course credit        |
+--------------+------------------------------------------+
| output       | Shows sample outputs from programs       |
+--------------+------------------------------------------+

Global Scripts
==============

.. code-block :: Bash

       # Find machine's $PATH, Find current dir
       echo $PATH | xcopyp
       pwd | xclip -selection clipboard

       # Create softlink from repo to $PATH
       sudo ln -sf `xclip -o` /usr/local/bin/
       chmod +x /usr/local/bin/git-pull.sh


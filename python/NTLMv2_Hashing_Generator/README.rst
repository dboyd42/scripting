NTLMv2 Hash Generator
#####################
:Author: David Boyd
:Date: 2022-01-03

About
*****

These programs are used generate a list of NTLMv2 hashes.  These programs
encode a files lines to match NTLMv2's encoding through UTF-16-bit Little
Endian.  In addition, Python's HashLib module is used to run the MD5 algorithm
and generate the proper hash.

+---------------------+-----------------------+----------------+
| features            | hash_ntlmv2_simple.py | hash_ntlmv2.py |
+=====================+=======================+================+
| file handling       | yes                   | yes            |
+---------------------+-----------------------+----------------+
| error handling      | no                    | yes            |
+---------------------+-----------------------+----------------+
| prone to user error | yes                   | no             |
+---------------------+-----------------------+----------------+

How to run the Hash_NTLMv2 programs
===================================
:Requirements: Python3, CLI

Hash_NTLMv2_simple.py
---------------------

.. code-block:: Bash

   ./hash_ntlmv2_simple.py <inputFile> <outputFile>

Hash_NTLMv2.py
--------------

.. code-block:: Bash

   ./hash_ntlmv2.py -i <inputFile> -o <outputFile>


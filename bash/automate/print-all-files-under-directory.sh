#!/usr/bin/bash
# Author: David Boyd
# Date: 2023-03-21
# Description: Prints all files (and nested files) under the CWD.
for DIR in ./*; do if [[ -d $DIR ]]; then cd $DIR; for FILE in ./*; do if [[ -f $FILE ]]; then lp -o sides=two-sided-long-edge -d Brother_DCP-L2540DW_series $FILE; cd ../; fi; done; fi; done

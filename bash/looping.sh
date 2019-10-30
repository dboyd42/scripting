#!/bin/bash

# for loops and CLI args
i=1
for arg in $*
do
    echo "arg $i: $arg"
    let i++
done

echo -e "\n"

# while loops
i=1
while [ $i -le 10 ]
do
    echo $i
    let i++ # you can use incrementers in lets
            # and, you don't need to use the $ here
done

echo -e "\n"

while [ $i -gt 1  ]
do
    let i--     # decrement first to assign i = 10
    echo $i
done


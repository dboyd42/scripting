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
echo "while loop -lt"
echo "--------------"
i=1
while [ $i -le 10 ]
do
    echo $i
    i=`expr $i + 1`
    #let i++ # you can use incrementers in lets
            # and, you don't need to use the $ here
done

echo -e "\n"
echo "while loop -gt"
echo "--------------"
while [[ $i -gt 1  ]]       # either syntax works
do
    let i--     # decrement first to assign i = 10
    echo $i
done

echo -e "\n"
# for loops
echo "for loop w/ c syntax"
echo "--------------------"
for ((i=0; i<10; i++))
do
    echo "$i"
done


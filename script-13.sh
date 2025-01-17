#!/bin/bash

#Loops

#Print 1-N
echo "Printing 1-10"
for i in {1..10}; do
    echo $i
done

echo "Enter Number : "
read NUMBER
echo "Printing 1-$NUMBER "

for i in {1..$NUMBER}; do
    echo $i
done

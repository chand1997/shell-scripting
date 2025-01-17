#!/bin/bash

#Loops

#Print 1-N
echo "Printing 1-10"
for i in {1..10}; do
    $i
done

echo "Enter Number : "
read NUMBER
for i in $(seq 1 $NUMBER); do
    $i
done

#!/bin/bash

NUMBER1=$1
NUMBER2=$2

TIMESTAMP=$($date)

SUM=$(($NUMBER1+$NUMBER2))

echo "Script executed at : $TIMESTAMP"
echo "The sum is of ${NUMBER1} and ${NUMBER2} : $SUM"
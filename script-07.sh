#!/bin/bash

#Program to write whether day is weekday or weekend

if [[ $(date +%w) == 0 || $(date +%w) == 6 ]]
then
echo "Weekend"
else 
echo "Weekday"
fi
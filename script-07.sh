#!/bin/bash

#Program to write whether day is weekday or weekend

# -eq -->equals to , -gt-->greater than , -lt-->less than , 
# -ge-->greater than or equal , -le-->less than or equal

#if [[ $(date +%w) == 0 || $(date +%w) == 6 ]]   
if [ $(date +%w) -eq 0 ] || [ $(date +%w) -eq 6 ]
then
echo "Weekend"
else 
echo "Weekday"
fi
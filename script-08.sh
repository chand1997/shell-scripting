#!/bin/bash

#Switch case


DAY=$(date +%w)

case $DAY in
0) echo "Sunday";;
1) echo "Monday";;
2) echo "Tuesday";;
3) echo "Wednesday";;
4) echo "Thursday";;
5) echo "Friday";;
6) echo "Saturday";;
*) echo "Done";;  # this is not compulsory in this case because day will not give anything apart from 0-6
esac


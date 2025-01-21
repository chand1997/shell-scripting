#!/bin/bash

#Cronatb practice

mkdir -p /home/ec2-user/dummy-logs

FOLDER="/home/ec2-user/dummy-logs"

DATE=$(date)
FILE="$FOLDER/logs-$DATE.log"

echo "Date : $DATE " $>>$FILE
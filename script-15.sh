#!/bin/bash

#Cleaning files older than particular days

SOURCE_DIRECTORY="/home/ec2-user/dummy-logs"
FILES_TO_REMOVE=$(find $SOURCE_DIRECTORY -name "*.log" -mtime +14)

while read -r file; do
    echo "Deleting : $file"
    rm -rf "$file"
done <<<"$FILES_TO_REMOVE"

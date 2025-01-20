#!/bin/bash

# script to backup files

SOURCE_DIRECTORY=$1
DEST_DIRECTORY=$2
DAYS="${3:-14}"
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)

if [ $# -ne 2 ]; then
    echo "USAGE :: <source-direc> <dest-direc> <days>(optional)"
    exit 1
fi

if [ ! -d $SOURCE_DIRECTORY ]; then
    echo "$SOURCE_DIRECTORY does not exist"
    exit 1
fi

if [ ! -d $DEST_DIRECTORY ]; then
    echo "$DEST_DIRECTORY does not exist"
    exit 1
fi

FILES_TO_REMOVE=$(find $SOURCE_DIRECTORY -name "*.log" -mtime +$DAYS)

if [ ! -n "$FILES_TO_REMOVE" ]; then
    echo "Files older than $DAYS does not exist"
    exit 1
fi

ZIP="/$DEST_DIRECTORY/$TIME_STAMP-logs"

find $SOURCE_DIRECTORY -name "*.log" -mtime +$DAYS | zip @ "$ZIP"

if [ ! -f "$ZIP" ]; then
    echo "Zip file not created"
    exit 1
fi

for file in $(find "$SOURCE_DIRECTORY" -name "*.log" -mtime +$DAYS); do
    rm -rf file
done

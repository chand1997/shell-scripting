#!/bin/bash

FILES=$(df -hT | grep xfs)
DISK_THRESHOLD=5
MSG=""

while read -r file; do

    # awk -F " " "{print $6F}" or  awk '{print $6}'  we can directly write like this if space is delimeter.

    USAGE=$(echo $file | awk '{print $6}' | cut -d "%" -f1)

    PARTITION=$(echo $file | awk '{print $NF}')

    if [ $USAGE -ge $DISK_THRESHOLD ]; then
        MSG+="Disk storage is: $USAGE% of partition: $PARTITION\n"
    fi
done <<<"$FILES"

# inorder to make \n (next line) work, we use -e
echo -e "$MSG"

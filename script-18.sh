#!/bin/bash

FILES=$(df -hT | grep xfs)
DISK_THRESHOLD=5
MSG=""

while read -r file; do
    USAGE=$(echo $file | awk -F " " "{print $6F}" | cut -d "%" -f1)
    PARTITION=$(echo $file | awk -F " " "{print $NF}")
    if [ $USAGE -ge $DISK_THRESHOLD ]; then
        MSG+="Disk storage is : $USAGE of partition : $PARTITION"
    fi

done <<<$FILES

echo $MSG

#!/bin/bash

FILES=$(df -hT | grep xfs)
DISK_THRESHOLD=5
MSG=""

# Loop through each line of the output
while read -r file; do
    # Extract the usage percentage
    USAGE=$(echo $file | awk '{print $6}' | cut -d "%" -f1)
    # Extract the partition name
    PARTITION=$(echo $file | awk '{print $NF}')

    # Check if the usage exceeds the threshold
    if [ $USAGE -ge $DISK_THRESHOLD ]; then
        MSG+="Disk storage is: $USAGE% of partition: $PARTITION\n"
    fi
done <<<"$FILES"

# Output the message
echo -e "$MSG"

#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=5 #real projects, it is usually 75

echo "disk usage is  $DISK_USAGE"
while IFS= read -r line #IFS,internal field seperatpor, empty it will ignore while space.-r is for not to ingore special charecters like /
do
echo "the $line"
    USAGE=$(echo $line | grep xfs | awk -F " " '{print $6F}' | cut -d "%" -f1)
    PARTITION=$(echo $line | grep xfs | awk -F " " '{print $NF}')
    if [ $USAGE -ge $DISK_THRESHOLD ]
    then
        echo "$PARTITION is more than $DISK_THRESHOLD, current value: $USAGE. Please check"
    fi
done <<< $DISK_USAGE

 USAGE_VAL=$(echo $DISK_USAGE | grep xfs | awk -F " " '{print $6F}' | cut -d "%" -f1)
 echo "The disk usage value IS $USAGE_VAL "

 array_length=${#USAGE_VAL}
 echo "the Array length is $array_length"



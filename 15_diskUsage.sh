#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=5 #real projects, it is usually 75


# while IFS= read -r line #IFS,internal field seperatpor, empty it will ignore while space.-r is for not to ingore special charecters like /
# do

#     USAGE=$(echo $line | grep xfs | awk -F " " '{print $6F}' | cut -d "%" -f1)
#     PARTITION=$(echo $line | grep xfs | awk -F " " '{print $NF}')
#     if [ $USAGE -ge $DISK_THRESHOLD ]
#     then
#         echo "$PARTITION is more than $DISK_THRESHOLD, current value: $USAGE. Please check"
#     fi
# done <<< $DISK_USAGE

 USAGE_VAL=($(df -hT | grep xfs | awk '{print $6}' | cut -d "%" -f1))
 array_length=${#USAGE_VAL[@]}
 count=0

if [ $array_length -gt 0 ]
then
while [ $array_length -gt $count ]
do
echo "print the count "${USAGE_VAL[$count]}" "
count=$((count+1))
done
fi



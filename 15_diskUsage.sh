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


while [ $array_length -gt $count ]
do
MEM_VAL=${USAGE_VAL[$count]}
if [ $MEM_VAL -gt $DISK_THRESHOLD ]
then
PARTITION_FOL=($(df -hT | grep xfs | awk -F " " '{print $NF}'))
echo " THE more memory consumption folder are: "${PARTITION_FOL[$count]}"  "
fi

count=$((count+1))
done




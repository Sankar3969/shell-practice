#! bin/bash

DISK_SPACE=$(df -hT | grep xfs)
DEFAULT_VAL=5
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
R="\e[1;31m"
G="\e[1;32m"
N="\e[1;0m"
Y="\e[1;33m"

xfs_values=($(df -hT | grep xfs | awk -F " " '{print $6F}' | cut -d "%" -f1))

echo "the disk value is $xfs_values"
if [ ! -z $xfs_values ]
then
while IFS= read -r val1;
do

echo "the disk value is $xfs_values"

echo " val1 is $val1" 
    if [ $val1 -gt $DEFAULT_VAL ]
    then
    MEMORY_FOLDERS=$(echo $DISK_SPACE | awk -F " " '{print $NF}' | cut -d "%" -f1)
    echo "More memory folders are:  $MEMORY_FOLDERS "
    else

    echo "all are less than 5 "
    fi

done <<< $xfs_values
else
echo "DISK_MEM_VAL is empty"
fi


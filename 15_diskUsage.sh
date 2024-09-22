#! bin/bash

DISK_SPACE=$(df -hT | grep xfs)
DEFAULT_VAL=5
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
R="\e[1;31m"
G="\e[1;32m"
N="\e[1;0m"
Y="\e[1;33m"

DISK_MEM_VAL=$($($DISK_SPACE | awk -F " " '{print $6F}' | cut -d "%" -f1))

if [ ! -z $DISK_MEM_VAL ]
then
while IFS= read -r val1;
do

echo "the disk value is $DISK_MEM_VAL"

echo " val1 is $val1" 
    if [ $val1 -gt $DEFAULT_VAL ]
    then
    MEMORY_FOLDERS=$(echo $DISK_SPACE | awk -F " " '{print $NF}' | cut -d "%" -f1)
    echo "More memory folders are:  $MEMORY_FOLDERS "
    else

    echo "all are less than 5 "
    fi

done <<< $DISK_MEM_VAL
else
echo "DISK_MEM_VAL is empty"
fi


#! bin/bash

SOURCE_DIR="/home/ec2-user/logs"
R="\e33m"
G="\e32m"
Y="\e31m"
N="\0m"

if [ ! -d $SOURCE_DIR ]
then
    echo " the source directory $SOURCE_DIR not exists" 
    exit 1
else
    echo " the source $SOURCE_DIR exists, proceed for delete "
fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime -14)

echo "files are : $FILES"

while IFS= read -r file
do
rm -rf $file
done <<< FILES
#! bin/bash

SOURCE_FOLDER=/home/ec2-user/app-logs
DEST_FOLDER=$2
DAYS=${3:-14}
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
R="\e[1;31m"
G="\e[1;32m"
N="\e[1;0m"
Y="\e[1;33m"

USAGE(){
    echo -e " correct usage is file_name.sh <DEST_FOLDER> <DEST_FOLDER> <Days is Optional>"
}

if [ $# -lt 2 ]
then 
USAGE
exit 1
fi

if [ ! -d $SOURCE_FOLDER ]
then
echo -e " $R  $SOURCE_FOLDER does not exists.. $N"
fi


if [ ! -d $DEST_FOLDER ]
then
echo -e " $R  $DEST_FOLDER does not exists.. $N"
fi

FILES=$(find ${SOURCE_FOLDER} -name "*.log" -mtime +14)
echo "Files: $FILES"

if [ ! -z $FILES ]
then
echo -e " $G files are not empty in sorce folder. Please proceed for backup $N"

ZIP_FILE="$DEST_FOLDER/BACKUP-$TIMESTAMP.zip"

$FILES | zip $ZIP_FILE -@
if [ ! -z $ZIP_FILE ]
then
echo "Zip file created content moved from source todestination"

while IFS= read -r file;
do
rm -rf $file
done <<< $FILES

else
echo "Zip creation is failed "
fi

else
echo -e " $R no files in sorce folder.  $N"
fi


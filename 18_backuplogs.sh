USERID=$(id -u)
SOURCE_FOLDER=$1
DEST_FOLDER=$2
R="\e33m"
G="\e32m"
USAGE () {
    echo " please pass source and destination folders with file name.."
}

if [ $# -eq  0 ] 
then
USAGE 
fi

if [ ! -d $SOURCE_FOLDER ]
then
echo " the source folder not exists"
else
echo " the source folder exists"
fi

if [ ! -d $DEST_FOLDER ]
then
echo " the dest folder not exists"
else
echo " the dest folder exists"
fi

FILES=$(find $SOURCE_FOLDER -name "*.log" -mtime -14) 
echo " the files exists $FILES"
if [ ! -z "$FILES" ]
then
ZIP_FILE=$(find $SOURCE_FOLDER -name "*.log" -mtime -14 | zip $DEST_FOLDER -@) 

if [ ! -z "$ZIP_FILE" ]
then
echo " zip fileis not created please check"
else
echo " backup complete and please initiating for deletion"

while IFS= read -r file
do
rm -rf $SOURCE_FOLDER
done <<< $FILES

fi
else 
echo "no file exists in source folder"
fi


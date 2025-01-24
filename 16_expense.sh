#!bin/bash
USERID=$(id -u)
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FOLDER="/var/log/expense"
FILE_NAME=$(echo $0 | cut -d "." -f1)
mkdir -p ${LOG_FOLDER}
echo " The  file name is: ${FILE_NAME} " 
LOG_FILE="${LOG_FOLDER}/${FILE_NAME}-${TIME_STAMP}.log"
echo " The log file  is: ${LOG_FILE} " 


CHECK_ACCESS () {
    if [ $USERID -ne 0 ]
    then
      echo -e " This user is not super user .. plese proceed with super user "
       exit 1
    else
        echo -e " This is super user please proceed with installation"
    fi
}
USAGE () {
   echo " the params $#"
   if [ "$#" -eq 0 ]
   then
   echo -e " please pass the parameters to execute the file 16_expense.sh param 1, param 2.."
   exit 1
   fi
}
VALIDATE () {
    dnf list installed $1
    EXE_STATUS=$? 
    if [ $EXE_STATUS -ne 0 ] 
    then 
    echo  "this $1 not istalled..proceeding for installation" | tee -a "$LOG_FILE"
    else 
    echo  " The $1 is already installed " | tee -a "$LOG_FILE"
    fi
}

CHECK_ACCESS
USAGE $@

for package in $@
do
dnf list installed $package &>>$LOG_FILE
VALIDATE $package
done

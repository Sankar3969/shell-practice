#! bin/bash

USERID=$(id -u)

R="\e[1;31m"
G="\e[1;32m"
N="\e[1;0m"
Y="\e[1;33m"

 FILE_PATH="/var/log/expense"
 FILE_NAME=$(echo $0 | cut -d "." -f1 )
 TIME_STAMP=$(date +%F-%H-%M-%S)

 LOG_FILE="$FILE_PATH/$FILE_NAME-$TIME_STAMP.log"
 mkdir -p $LOG_FILE

# LOGS_FOLDER="/var/log/expense"
#  SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
#  TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
#  LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
#  mkdir -p $LOGS_FOLDER

if [ $USERID -ne 0 ]
then
echo  -e " This not super user. $R please login with super user $N " | tee -a $LOG_FILE  
exit 1
else
echo  -e " $G you have super user access $N " | tee -a $LOG_FILE
fi

VALIDATE(){
    if [ $1 -ne 0 ]
    then
    echo -e " $2 Installation is $R Failed ... $N " | tee -a $LOG_FILE  
    else
    echo -e " $2 Installation is $G success ... $N " | tee -a $LOG_FILE  
    fi
}
INSTALLATION_STATUS(){
    dnf list installed $1 
     if [ $? -ne 0 ]
     then 
     local val=0
     echo $val
     else
     local val=1
     echo $val
     fi
}

INS_STATUS=$(INSTALLATION_STATUS "mysql")

if [ $INS_STATUS -eq 0 ]
then
     echo -e " mysql is not exsisting $Y please procees to install $N" | tee -a $LOG_FILE 
else 
echo -e "$1  $G already installed skipping ... $N " | tee -a $LOG_FILE    
fi           

#! bin/bash

USERID=$(id -u)
R="\e[1;31m"
G="\e[1;32m"
N="\e[1;0m"
Y="\e[1;33m"

FILE_FOLDER="/var/log/expense"
FILE_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$FILE_FOLDER/$FILE_NAME-$TIMESTAMP.log"
mkdir -p $FILE_FOLDER

if [ $USERID -ne 0 ]
then
echo -e " $R This user is not super user Please run with super user $N" | tee -a $LOG_FILE
exit 1
else
echo -e " $G This user is super user proceeding further $N" | tee -a $LOG_FILE
end
fi
INSTALLATION_STATUS (){
    dnf list installed $1
    if [ $? -ne 0 ]
    then
     echo -e "$R the $1 is not installed proceeding to install " | tee -a $LOG_FILE
     val=1
    else 
    echo -e "$G The $1 is already installed $N" | tee -a $LOG_FILE
    val=0
    fi
}
VALIDATE (){
    if [ $1 -ne 0 ]
    then
    echo -e "$R The $2   is $R Failed... $N" | tee -a $LOG_FILE
    else
    echo -e "$R The $2   is $G Success... $N" | tee -a $LOG_FILE
    fi
}

   dnf module disable nodejs:18 -y | tee -a $LOG_FILE
   VALIDATE $? " disable nodejs:18"
   dnf module enable nodejs:20 -y | tee -a $LOG_FILE
   VALIDATE $? " disable nodejs:20"

   INSTALLATION_STATUS "nodejs"
   if[ $val -ne 0 ]
   then
   dnf install nodejs -y | tee -a $LOG_FILE
   VALIDATE $? " nodejs"
   fi

   mkdir -p /app
   
   useradd expense
   if [$? -ne 0]
   then
   echo -e " $R user is already exists $N" | tee -a $LOG_FILE
   else
   echo -e " $G expense user creted successfully $N" | tee -a $LOG_FILE
   fi
   cd /app
   rm -rf *

   



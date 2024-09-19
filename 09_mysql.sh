#! bin/bash

USERID=$(id -u)

R="\e[%31m"
G="\e[%32m"
N="\e[%0m"
Y="\e[%33m"

FILE_PATH="/var/log/expense"
FILE_NAME=$(echo $0 | cut -d '.' -f1 )
TIME_STAMP=$(date "+%F-%H-%M-%S")

LOG_FILE="$FILE_PATH/$FILE_NAME-$TIME_STAMP.log"
mkdir -p $LOG_FILE

if [ $USERID -ne 0 ]
then
echo  -e " This not super user. $R please login with super user $N " | tee -a $LOG_FILE  
exit1
else
echo  -e " $G you have super user access $N " | tee -a $LOG_FILE
fi

VALIDATE(){
    if [ $1 -ne 0 ]
    then
    echo " $2 Installation is $R Failed ... $N "
    else
    echo " $2 Installation is $G success ... $N "
    fi
}
INSTALLATION-STATUS(){
    dnf list installed $1 
     if [ $? -ne 0 ]
     then 
     echo "$1 is not exsisting $Y please procees to install $N"
     local val=0
     echo $val
     else
     echo " echo "$1 is already installed skipping to install $N""
     local val=1
     echo $val
     fi
}

INS_STATUS=$(NSTALLATION-STATUS | tail -n 1)
echo "the status is $INS_STATUS"
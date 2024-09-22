#! bin/bash
USERID=$(id -u)
R="\e[1;31m" 
G="\e[1;32m" 
N="\e[%0m"
Y="\e[1;33m"

FILE_NAME=$0
echo "initial file name is $FILE_NAME "


fname=$(echo $FILE_NAME | cut -f1 -d"." )

TIME_STAMP=$(date "+%F-%H-%M-%S")
FILE_PATH="/var/log/expence"
LOG_FILE="$FILE_PATH/$fname-$TIME_STAMP.log"
mkdir -p $LOG_FILE #create the folder
echo "log file is :$LOG_FILE" | tee -a $LOG_FILE

CHECK_ACCESS()
{
    
    if [ ${USERID} -ne 0 ]
    then
    echo  -e " This is not super user please run with super user $N" | tee -a $LOG_FILE
    exit 1
    else
    echo -e "you have super user access proceeding for installation $N" | tee -a $LOG_FILE
    fi
} 

CHECK_ACCESS

COMMAND_STATUS (){
if [ $1 == 0 ]
then
echo " $2 is scussfully run " | tee -a $LOG_FILE
else
echo " $2 is alread success " | tee -a $LOG_FILE
fi
}


VALIDATE() {
if [[ $1 -ne 0 ]]
then
echo " $2 is not installed  proceeding for to install " | tee -a $LOG_FILE
local val=1
echo $val
else 
echo " $2 is aalready installed " | tee -a $LOG_FILE
local val=0
echo $val
fi
}
for package in $@
do
echo "package id ${package}"
dnf list installed $package
val2=$(VALIDATE $? $package)
readarray -t readarray2 <<< "$val2"
echo " the values from readarray2 first value; ${readarray2[1]}" | tee -a $LOG_FILE
if [[ ${readarray2[1]} != 0 ]]
then
echo " ready to install"
dnf install $package -y
     if [[ $? == 0 ]]
     then
      echo " installed correctly" | tee -a $LOG_FILE
     fi
else
echo "$package is already installed" | tee -a $LOG_FILE

fi
done

dnf install mysql-server -y | tee -a $LOG_FILE
COMMAND_STATUS $? "mysql-server"

systemctl enable mysqld | tee -a $LOG_FILE 
COMMAND_STATUS $? "enable mysqld"

systemctl start mysqld | tee -a $LOG_FILE
COMMAND_STATUS $? "start mysqld"

systemctl status mysqld | tee -a $LOG_FILE
COMMAND_STATUS $? "status mysqld"

mysql -h mysql.sankardevops.shop -u root -pExpenseApp@1 -e 'show databases;' | tee -a $LOG_FILE
if [ $? -ne 0 ]
then
    echo "MySQL root password is not setup, setting now" | tee -a $LOG_FILE
    mysql_secure_installation --set-root-pass ExpenseApp@1
    VALIDATE $? "Setting UP root password"
else
    echo -e "MySQL root password is already setup...$Y SKIPPING $N" | tee -a $LOG_FILE
fi


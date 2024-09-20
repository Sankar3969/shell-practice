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
fi
INSTALLATION_STATUS (){
    dnf list installed $1
    if [ $? -ne 0 ]
    then
     echo -e "$R the $1 is not installed proceeding to install $N" | tee -a $LOG_FILE
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

INSTALLATION_STATUS "nginx"
if [ $val -ne 0 ]
then
dnf install nginx -y
VALIDATE $? "nginx"
fi

systemctl enable nginx 
VALIDATE $? "enable"

systemctl restart nginx/usr/share/nginx/html
VALIDATE $? "restart"

mkdir -p /app

curl -o /tmp/frontend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-frontend-v2.zip
VALIDATE $? "frontend.zip downloaded"


rm -rf /usr/share/nginx/html/*
VALIDATE $? "existing html content  deleted "

cd /usr/share/nginx/html/

unzip /tmp/frontend.zip
VALIDATE $? "frontend.zip unzipped"

cp -f /home/ec2-user/shell-practice/expense.conf /etc/nginx/default.d/expense.conf 
VALIDATE $? "expense conf file moved"

systemctl restart nginx 
VALIDATE $? "nginx restartted"






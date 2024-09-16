#! bin/bash

USERID=$(id -u)

echo "this UserId is $USERID"
VALIDATE(status){
if [ $status -ne 0 ]
then 
echo " Mysql is not exsisting , please proceed for instalation"

dnf install mysql -y
status =$?
    if [ $status -eq 0 ]
    then
    echo "mysql is succuessfully installed"
    exit 1
    else 
    echo "mysql installation is not success plaese check it"
    fi
else 
echo "Mysql is already installed"
fi
}
if [ $USERID -ne 0 ]
then
echo " This is not super user plaese procced with super user access"
exit 1
else
echo "this is super user plaese procced for installation"

dnf list installed mysql
echo "the status of mysql is: $?"

mysqlstatus=$?

VALIDATE $mysqlstatus

fi
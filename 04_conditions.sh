#! bin/bash

USERID=$(id -u)

echo "this UserId is $USERID"

if [ $USERID -ne 0 ]
then
echo " This is not super user plaese procced with super user access"
exit 1
else
echo "this is super user plaese procced for installation"

dnf list installed mysql
if [ $? -ne 0 ]
then 
echo " Mysql is not exsisting , please proceed for instalation"

dnf install mysql -y
    if [ $? -eq 0]
    then
    echo "mysql is succuessfully installed"
    exit 1
    fi
else 
echo "Mysql is already installed"
fi


fi
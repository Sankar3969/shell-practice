#! bin/bash
USERID=($id -u)
R="\e[%31m"
G="\e[%32m"
N="\e[%0m"
Y="\e[%33m"
CHECK_ACCESS()
{
    if [ $USERID -ne 0 ]
    then
    echo  -e " $R This is not super user please run with super user $N "
    exit 1
    else
    echo -e " $G you have super user access you can proceed for installation $N "
    fi
} 
#! bin/bash
USERID=$(id -u)
R="\e[1;31m" 
G="\e[1;32m" 
N="\e[%0m"
Y="\e[1;33m"
CHECK_ACCESS()
{
    
    if [ ${USERID} -ne 0 ]
    then
    echo  -e " This is not super user please run with super user $N"
    exit 1
    else
    echo -e "you have super user access proceeding for installation $N"
    fi
} 

CHECK_ACCESS

VALIDATE() {
if [ $1 -ne 0 ]
then
echo " $2 is not installed please proceed to install "
else 
echo " $2 is already installed "

fi
}

for package in $@
do
echo "parametars are $package"
dnf list installed $package
VALIDATE $? "$package"
done
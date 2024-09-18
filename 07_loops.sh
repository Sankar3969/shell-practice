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
if [[ $1 -ne 0 ]]
then
echo " $2 is not installed  proceeding for to install "
local val=1
echo $val
else 
echo " $2 is aalready installed "
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
echo " the values from readarray2 first value; ${readarray2[1]}"
done

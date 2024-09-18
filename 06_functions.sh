#! bin/bash

install_Status () {

dnf list installed $1
 #echo " The status of installation software  $1 is : $?"
local value=$?
echo "the software value is :$value "
echo $value
}
install_Status $1

status=$?
#status1=$(install_Status $1 | tail -n 1)
echo "the value : $status1"

# for package in $@
# do
# status1=$(install_Status $package)
# echo "the value : $status1"
# # if [ $status1 -ne 0 ]
# # then
# # echo "$1 software not installed please install"
# # else 
# # echo "$1 is already installed software"
# # fi

# done

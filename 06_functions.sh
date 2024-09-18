#! bin/bash

install_Status () {

dnf list installed $1
printf " The status of installation software  $1 is : $? "
status=$?
return $status
}

for package in $@
do
status=$(install_Status $package)
if [ $status -ne 0 ]
then
echo "$1 software not installed please install"
else 
echo "$1 is already installed software"
fi
done
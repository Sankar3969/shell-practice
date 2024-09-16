#! bin/bash

USERID=$(id -u)

if[ $USERID -ne 0 ]
then
echo " this is the super user you can proceed for installation"
else
echo "this is not super user plaese procced with super user access"
exit 1
fi
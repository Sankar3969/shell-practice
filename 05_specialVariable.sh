#! bin/bash

echo "All variables passed to the script $@"

echo " present script name name is $0 "

echo "Present working directory $PWD"

echo "Home directory of the present user $HOME"

echo " how to get output of the command $?"

echo "process id for the current shell script $$"

sleep 100 &
echo "PID of the last background process $!"
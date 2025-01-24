#! bin/bash
USERID=$(id -u)
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FOLDER="/var/log/expense"
FILE_NAME=$(echo $0 | cut -d "." -f1)
mkdir -p ${LOG_FOLDER}
echo " The  file name is: ${FILE_NAME} " 
LOG_FILE="${LOG_FOLDER}/${FILE_NAME}-${TIME_STAMP}.log"
echo " The log file  is: ${LOG_FILE} " 



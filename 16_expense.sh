#! bin/bash
USERID=$(id -u)
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FOLDER= "/var/log/expense"
mkdir -p ${LOG_FOLDER}
LOG_FILE= "${LOG_FOLDER}+${TIME_STAMP}.log"
echo " The log file  is: ${LOG_FILE} " 



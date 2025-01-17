#!/bin/bash

PACKAGES=$@

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


LOG_FOLDER="/var/log/shellscript_logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOGFILE_NAME="$LOG_FOLDER/$LOG_FILE-$TIME_STAMP.log"

VALIDATE() {
    if [ $1 -ne 0 ]; then
        echo -e "$2  $R FAILED $N "
        exit 1
    else
        echo -e "$2 $G SUCCESS $N "
    fi

}
echo "Script started executing at $TIME_STAMP" &>>$LOGFILE_NAME
if [ $(id -u) -ne 0 ]; then
    echo "Give root access"
    exit 1
fi

for package in $PACKAGES
do
echo "Checking whether $package is already installed" &>>$LOGFILE_NAME
dnf list installed $package &>>$LOGFILE_NAME
if [ $? -ne 0 ]
then
echo "$package is installing" &>>$LOGFILE_NAME
dnf install $package -y &>>$LOGFILE_NAME
VALIDATE $? "$package installation"
else
echo "$Y $package already installed $N"
fi
done
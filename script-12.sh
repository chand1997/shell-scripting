#!/bin/bash

#In this we are learning how to write log files.

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

echo "Checking whether mysql-server is already installed"

dnf list installed mysql-server | grep -q "mysql-server"

if [ $? -eq 0 ]; then
    echo -e " $Y Mysql-server already INSTALLED $N "
    exit 1
fi

echo "Mysql-server installing" &>>$LOGFILE_NAME

dnf install mysql-server -y &>>$LOGFILE_NAME

VALIDATE $? Mysql_Installation

echo "Starting mysql-server" &>>$LOGFILE_NAME 

systemctl start mysqld &>>$LOGFILE_NAME

VALIDATE $? Starting_Mysql

echo "Enabling Mysql-server" &>>$LOGFILE_NAME

systemctl enable mysqld &>>$LOGFILE_NAME

VALIDATE $? Enabling_Mysql

echo "Checking status of mysql-server" &>>$LOGFILE_NAME

systemctl status mysqld | grep -q "active (running)"

VALIDATE $? Status_checking

echo "Mysql-server successfully running" &>>$LOGFILE_NAME

sleep 2

echo "Deleting mysql-server" &>>$LOGFILE_NAME

dnf remove mysql-server -y &>>$LOGFILE_NAME

VALIDATE $? Removing_Mysql_server

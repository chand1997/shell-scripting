#!/bin/bash

#best way to write script-09

#These are color codes in shell. Inorder to use them use "-e"-->enabling.Use respected color code in echo.
R="\e[31m"
G="\e[32m"
Y="\e[33m"

VALIDATE() {
    if [ $1 -ne 0 ]; then
        echo -e "$2  $R FAILED"
        exit 1
    else
        echo -e "$2 $G SUCCESS"
    fi

}

if [ $(id -u) -ne 0 ]; then
    echo "Give root access"
    exit 1
fi

echo "Checking whether mysql-server is already installed"

dnf list installed mysql-server | grep -q "mysql-server"

if [ $? -eq 0 ]; then
    echo -e " $Y Mysql-server already INSTALLED"
    exit 1
fi

echo "Mysql-server installing"

dnf install mysql-server -y

VALIDATE $? Mysql_Installation

echo "Starting mysql-server"

systemctl start mysqld

VALIDATE $? Starting_Mysql

echo "Enabling Mysql-server"

systemctl enable mysqld

VALIDATE $? Enabling_Mysql

echo "Checking status of mysql-server"

systemctl status mysqld | grep -q "active (running)"

VALIDATE $? Status_checking

echo "Mysql-server successfully running"

sleep 2

echo "Deleting mysql-server"

dnf remove mysql-server -y

VALIDATE $? Removing_Mysql_server

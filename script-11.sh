#!/bin/bash

#best way to write script-09

VALIDATE() {
    if [ $1 -ne 0 ]; then
        echo "$2 failed"
        exit 1
    else
        echo "$2 success"
    fi

}

if [ $(id -u) -ne 0 ]; then
    echo "Give root access"
    exit 1
fi

echo "Checking whether mysql-server is already installed"

dnf list installed mysql-server | grep -q "mysql-server"

if [ $? -eq 0 ]; then
    echo "Mysql-server already installed"
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

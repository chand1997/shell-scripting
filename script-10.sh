#!/bin/bash

#Improvised way of writing script-09

VALIDATE(){
    if [[ $2 -eq 0 && $? -eq 0 ]]
    then
    echo "$1"
    exit 1
    fi

    if [ $? -ne 0 ]
    then
    echo "$1"
    exit 1
    echo "$2"
    fi
}



if [ $(id -u) -ne 0 ]
then
echo "Only root user can install"
exit 1
fi

dnf list installed | grep -q "mysql-server"

VALIDATE "Mysql-server already installed"

dnf install mysql-server -y

VALIDATE "Mysql-server failed to install" "Mysql-server successfully installed"

systemctl start mysqld

VALIDATE "Mysql-server failed to start" "Mysql-server successfully started"

systemctl enable mysqld

VALIDATE "Mysql-server failed to enable" "Mysql-server successfully enabled"

sytemctl status mysqld | grep -q "active (running)"

VALIDATE "Mysql-server is not running" "Mysql-server successfully running"









#!/bin/bash

#Improvised way of writing script-09

VALIDATE(){
    if [ $? -ne 0 ]
    then
    echo "$1"
    exit 1
    else
    echo "$2"
    fi
}



if [ $(id -u) -ne 0 ]
then
echo "Only root user can install"
exit 1
fi

dnf list installed | grep -q "mysql-server"

VALIDATE Mysql_server_already_installed Mysql_server_not_installed

dnf install mysql-server -y

VALIDATE Mysql_server_failed_to_install Mysql_server_successfully_installed

systemctl start mysqld

VALIDATE Mysql_server_failed_to_start Mysql_server_successfully_started


systemctl enable mysqld

VALIDATE Mysql_server_failed_to_enable Mysql_server_successfully_enabled


systemctl status mysqld | grep -q "active (running)"

VALIDATE Mysql_server_not_active Mysql_server_successfully_running










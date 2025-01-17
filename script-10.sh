#!/bin/bash

#Improvised way of writing script-09

VALIDATE() {
    if [ $? -ne 0 ]; then
        echo "$1"
        exit 1
    else
        echo "$2"
    fi
}
VALIDATE1() {
    if [ $? -eq 0 ]; then
        echo "$1"
        exit 1
    fi
}

if [ $(id -u) -ne 0 ]; then
    echo "Only root user can install"
    exit 1
fi

echo "Checking_for_already_installed"

dnf list installed mysql-server | grep -q "mysql-server"

VALIDATE1 Mysql_server_already_installed

echo "Installing_mysql"

dnf install mysql-server -y

VALIDATE Mysql_server_failed_to_install Mysql_server_successfully_installed

echo "Starting_mysql"

systemctl start mysqld

VALIDATE Mysql_server_failed_to_start Mysql_server_successfully_started

echo "Enabling mysql"
systemctl enable mysqld

VALIDATE Mysql_server_failed_to_enable Mysql_server_successfully_enabled

echo "Checking status of mysql"
systemctl status mysqld | grep -q "active (running)"

VALIDATE Mysql_server_not_active Mysql_server_successfully_running

#!/bin/bash

#Installing mysql

if [ $(id -u) -ne 0 ]
then
echo "should login as root user"
exit 1
fi
echo "Installing mysql-server"
dnf install mysql-server -y

echo "Starting mysql server"
systemctl start mysqld

echo "Enabling mysql server"
systemctl enable mysqld

echo "Checking status of mysql server"
systemctl status mysqld
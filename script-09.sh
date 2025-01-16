#!/bin/bash

#Installing mysql

if [ $(id -u) -ne 0 ]
then
echo "should login as root user"
exit 1 
 #  "exit 0" means the further lines will execute  otherwise the code stops there itself.
 #  we can write "exit n" to stop executing the further code(n--> any number other than 0)
fi

# Below code is checking whether mysql-server is already installed.
dnf list installed mysql-server | grep -q "mysql-server"
if [ $? -eq 0 ]
then
echo "Mysql-server is already Installed"
exit 1
fi

echo "Installing mysql-server"
dnf install mysql-server -y

# $? gives exit code of previous code

if [ $? -ne 0 ]
then
echo "Installation Failed"
exit 1
else
echo "Installation successful"
fi

echo "Starting mysql server"
systemctl start mysqld

if [ $? -ne 0 ]
then
echo "Failed to start mysql"
exit 1
else
echo "Mysql started successful"
fi

echo "Enabling mysql server"
systemctl enable mysqld

if [ $? -ne 0 ]
then
echo "Failed to enable mysql"
exit 1
else
echo "Mysql enabled successful"
fi

echo "Checking status of mysql server"
systemctl status mysqld | grep -q "active (running)"
# the above code checks for pattern in double quotes and if it finds it will retun exit 0.

if [ $? -ne 0 ]
then
echo "Mysql is not running."
exit 1
else
echo "Mysql is running successful"
fi




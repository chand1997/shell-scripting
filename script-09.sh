#!/bin/bash

#Installing mysql

sudo su -
dnf install mysql-server -y
systemctl start mysqld
systemctl enable mysqld
systemctl status mysqld
#!/bin/bash

# How to take variables like username and password(confidentials)

echo "Enter username :"

read -s USERNAME # -s -> to hide whatever entered

echo "USERNAME ENTERED : $USERNAME" # it is showing just because we printed it.

echo "Enter Password :"

read -s PASSWORD

echo "Password entered"

#!/bin/bash

#Special variables

#how to run this script -> sh script-06.sh input1 input2 .... (input can be anything)

echo "All inputs : $@"
echo "number of variables : $#"
echo "script name : $0" 
echo "present working directory : $PWD"
echo "process id of current script : $$"
echo "home directory of current user : $HOME"
echo "which user running script : $USER"
sleep 50 &
echo "process id of last command in background : $!"
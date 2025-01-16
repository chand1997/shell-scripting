#!/bin/bash

#Special variables

VARIBLE=Chandan
echo "$VARIABLE"
echo "All inputs : $@"
echo "number of variables : $#"
echo "script name : $0" 
echo "present working directory : $PWD"
echo "process id of current script : $$"
echo "home directory of current user : $HOME"
echo "which user running script : $USER"
sleep 50 &
echo "process id of last command in background : $!"
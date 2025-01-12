#1/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
 echo : "error you must have sudo access to execute this script"

 fi

 dnf install mysql -y

 dnf install git -y
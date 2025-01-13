#1/bin/bash

USERID=$(id -u)

 VALIDATE() {

    if [ $? -ne 0 ]
  then
   echo : " $2 is failure"
   exit 1

    else
     echo : " $2 is success"

     fi

 }

if [ $USERID -ne 0 ]
then
 echo : "error you must have sudo access to execute this script"

 exit 1

 fi

 dnf list installed mysql

 if [ $? -ne 0 ]

 then
 dnf install mysql -y

 VALIDATE $! "installing mysql"

     else
      echo : " mysql is already installed"
      fi


 dnf list installed git

  if [ $? -ne 0 ]
  then

 dnf install git -y

VALIDATE $! "installing git"

     else
     echo : " git is already installed"
      fi




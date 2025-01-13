#1/bin/bash

USERID=$(id -u)

LOGS_FOLDER="/var/log/shellscript-log"
LOG_FILE=$( echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.LOG"

 VALIDATE() {

    if [ $? -ne 0 ]
  then
   echo : " $2 is failure"
   exit 1

    else
     echo : " $2 is success"

     fi

 }
echo "script started executing at: $TIMESTAMP" &>>$LOG_FILE
if [ $USERID -ne 0 ]
then
 echo : "error you must have sudo access to execute this script"

 exit 1

 fi

 dnf list installed mysql &>>$LOG_FILE

 if [ $? -ne 0 ]

 then
 dnf install mysql -y &>>$LOG_FILE

 VALIDATE $! "installing mysql"

     else
      echo : " mysql is already installed"
      fi


 dnf list installed git &>>$LOG_FILE

  if [ $? -ne 0 ]
  then

 dnf install git -y &>>$LOG_FILE

VALIDATE $! "installing git"

     else
     echo : " git is already installed"
      fi




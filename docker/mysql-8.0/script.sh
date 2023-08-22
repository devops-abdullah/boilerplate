#!/bin/bash
set -e

echo "Script Execution Time: `date`"

echo "**************************************************"
echo " Author: Abdullah Manzoor"
echo " Email: abdullah.itdeft@gmail.com"
echo "**************************************************"

check_db=`mysql --user=root --host=mysql --password=${MYSQL_ROOT_PASSWORD} --port=3306 -e "show databases;" | grep test | head -n 1 | wc -l`
check_user=`mysql --user=root --host=mysql --password=${MYSQL_ROOT_PASSWORD} --port=3306 -e "select user,host from mysql.user;" | grep testuser | head -n 1 | wc -l`

if [ "$check_user" = 0 ]; then
    echo "Database User testuser not exist going to create user ...!"
    mysql --user=root --host=mysql --password=${MYSQL_ROOT_PASSWORD} --port=3306 < /user.sql
    else
    echo "Database Users are Already Exists Nothing to Do"
fi

if [ "$check_db" = 0 ]; then
    echo "Database test not exist going to create new database ...!"
    mysql --user=root --host=mysql --password=${MYSQL_ROOT_PASSWORD} --port=3306 < /test.sql
    else
    echo "Database text Exist Already Nothing to Do"
fi
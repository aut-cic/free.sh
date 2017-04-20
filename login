#!/bin/bash

echo "FAUTLogin by parham.alvani @ 2016"

code_status=`curl -k -s -o /dev/null -w "%{http_code}" -X GET "https://internet.aut.ac.ir/"`
if [ $code_status == '302' ]; then
	echo "[FAUTLogin] > You are already login"
	exit 0
fi


if [ $# -lt 2 ]; then
	echo -n "[FAUTLogin] > Enter your username and press [ENTER]: "
	read username
	echo -n "[FAUTLogin] > Enter your password and press [ENTER]: "
	read -s password
	echo
else
	username=$1
	password=$2
fi

code_login=`curl -k -s -o /dev/null -w "%{http_code}" \
	-X POST \
	-H "Content-Type: application/x-www-form-urlencoded" \
	-d "erase-cookie=false&password=$password&popup=false&username=$username" \
	"https://login.aut.ac.ir/login"`

if [ $code_login == '302' ]; then
	echo "[FAUTLogin] > Login was successful."
else
	echo "[FAUTLogin] > Login was failed."
fi

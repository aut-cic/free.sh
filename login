#!/bin/bash

echo "free.sh by Iman Tabrizian @ 2016"

code_status=$(curl -k -s -o /dev/null -w "%{http_code}" -X GET "https://internet.aut.ac.ir/")
if [ "$code_status" == '302' ]; then
	echo "[free.sh] > You are already login"
	exit 0
fi

if [ $# -lt 2 ]; then
	echo -n "[free.sh] > Enter your username and press [ENTER]: "
	read -r username
	echo -n "[free.sh] > Enter your password and press [ENTER]: "
	read -rs password
	echo
else
	username=$1
	password=$2
fi

curl -k -s -o /dev/null \
	-X POST \
	-H "Content-Type: application/x-www-form-urlencoded" \
	-d "erase-cookie=false&password=$password&popup=false&username=$username" \
	"https://login.aut.ac.ir/login"
code_login=$(curl -k -s -o /dev/null -w "%{http_code}" -X GET "https://internet.aut.ac.ir/")

if [ "$code_login" == '302' ]; then
	echo "[free.sh] > Login was successful."
	exit 0
else
	echo "[free.sh] > Login was failed."
	exit 1
fi

#!/bin/bash

echo "Welcome to AUT Login system !"
echo -n "Enter your username and press [ENTER]: "
read username
echo -n "Enter your password and press [ENTER]: "
read -s password
echo

code=`curl -k -s -o /dev/null -w "%{http_code}" \
    -X POST \
    -H "Content-Type: application/x-www-form-urlencoded" \
    -d "erase-cookie=false&password=$password&popup=false&username=$username" \
    "https://login.aut.ac.ir/login"`

if [ $code == '302' ]; then
	echo "Login was successful."
else
	echo "Login was failed."
fi

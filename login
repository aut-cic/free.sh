#!/bin/bash

program_name=$0

echo "free.sh by Iman Tabrizian @ 2016"

usage() {
	echo ""
	echo "usage: $program_name [-l]"
	echo "  -l   loop over login"
	echo ""
}

username=""
password=""

login() {
	code_status=$(curl -k -s -o /dev/null -w "%{http_code}" -X GET "https://internet.aut.ac.ir/")
	if [ "$code_status" == '302' ]; then
		echo "[free.sh] > You are already login"
		return 0
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
		return 0
	else
		echo "[free.sh] > Login was failed."
		return 1
	fi
}

# parses options flags
while getopts 'l' argv; do
	case $argv in
	l)
		loop=true
		;;
	*)
		usage
		;;
	esac
done

for ((i = 2; i <= OPTIND; i++)); do
	shift
done

login "$@"

if [ "$loop" = true ]; then
	while true; do
		login "$username" "$password"
		sleep 1
	done
fi

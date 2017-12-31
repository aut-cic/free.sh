# free.sh

*Based on [free.sh](https://github.com/tabrizian/free.sh) from Iman Tabrizian*

## Introduction

Amirkabir university of technology create new challenge for student, **Internet monitoring service**.
Let's login from terminal to do more funny things !

## Manual
```sh
curl -k -s -o /dev/null \
	-X POST \
	-H "Content-Type: application/x-www-form-urlencoded" \
	-d "erase-cookie=false&password=$password&popup=false&username=$username" \
	"https://login.aut.ac.ir/login"`
```
Make sure to replace ```$username``` with your username and ```$password``` with your password.

## Run
Run is pretty simple:

```sh
# interactive mode login
./login

# detach mode login
./login username password

# logout
./logout
```

**NOTE:** Use it **without** your email postfix i.e. *@aut.ac.ir*.

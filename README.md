# free.sh

_Based on [free.sh](https://github.com/tabrizian/free.sh) from Iman Tabrizian_

## Introduction

Amirkabir University of Technology create new challenge for student, **Internet monitoring service**.
Let's log in from terminal to do more funny things!

## Manual

```bash
curl -k -s -o /dev/null \
 -X POST \
 -H "Content-Type: application/x-www-form-urlencoded" \
 -d "erase-cookie=false&password=$password&popup=false&username=$username" \
 "https://login.aut.ac.ir/login"`
```

Make sure to replace `$username` with your username and `$password` with your password.

## Run

Run is pretty simple:

```bash
# interactive mode login
./login

# detach mode login
./login username password

# logout
./logout
```

**NOTE:** Use it **without** your email postfix i.e. _@aut.ac.ir_.

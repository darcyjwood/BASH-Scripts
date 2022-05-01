#!/bin/bash



echo "Hello. So, you'd like to add a new user? Let's get started."
sleep 2

if [ $(id -u) -eq 0 ]; then
	read -p "Please enter a new user name : " username
	sleep 2
	read -s -p "Next, we'll enter a password for the new user : " password
	sleep 2

	egrep "^$username" /etc/passwd > /dev/null
	if [ $? -eq 0 ]; then
		echo "$username exists!"
		exit 1
	else
		sudo useradd -m -p "$pass" "$username"
		[ $? -eq 0 ] && echo -e "\n$username has been added to the system." || echo "User was not added."
	fi
else 
	echo "Only root may add a user to the system."
	exit 2
fi

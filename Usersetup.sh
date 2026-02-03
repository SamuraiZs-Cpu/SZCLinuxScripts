#!bin/bash

#########################
#   User Setup script   #
#########################
servera="student@servera"
serverb="student@serverb"

# get username.txt 
read -r -p "Enter your username ('A-z9-0_'): " username
if [[ $username =~ ^[A-za-z9-0_]+$ ]]; then
	echo "Hello, $nickname!"
	echo $nickname > ~/.username.txt
else
	echo "Unauthorized characters detected. Exiting script"
	exit 1
fi

sendsetupfiles(){
#Send setup scripts to my servers
scp ~/.username.txt $servera:~
scp ~/setupa.sh $servera:~
scp ~/.username.txt $serverb:~
scp ~/setupb.sh $serverb:~
}


sendsetupfiles

#!bin/bash

#change message of the day
changemotd(){
(cd /etc/motd.d/
rm insights-client
mv cockpit newmotd
echo "Connecting to Server B" > newmotd)
}

#change user prompt value
myusername=$(<".username.txt")
changeps1(){
echo 'PS1="\[\033[1m\]['$myusername'@srvB \W]$ \[\033[0m\]"'>>.bashrc;source .bashrc
echo 'PS1="\[\033[1m\]['$myusername'ROOT@srvB \W]# \[\033[0m\]"'>>/root/.bashrc
}

changemotd
changeps1

unset changeps1 changemotd



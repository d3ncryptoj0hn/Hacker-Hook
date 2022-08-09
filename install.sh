#!/bin/bash
BGreen='\033[1;32m'       # Green
BRed='\033[1;31m'         # Red
printf "${BGreen}Process Start!\n\n"
sudo apt-get update
sudo apt-get install -y php curl wget xterm unzip npm ssh openssh-server
sudo python -m pip install --upgrade pip
sudo python3 -m pip install --upgrade pip
sudo python -m pip install pyngrok
sudo python3 -m pip install pyngrok
sudo npm install -g localtunnel
if [[ -e webpage ]]; then
unzip webpage.zip
fi
# ngrok check
if [[ -e ngrok-stable-linux-amd64.zip ]]; then
unzip ngrok-stable-linux-amd64.zip
else
printf "Unzip ngrok file and move it on /usr/local/bin \n"
exit 1
fi
if [[ ngrok ]]; then
printf "${BGreen}Yey ngrok is here!\n"
chmod +x ngrok
sudo mv ngrok /usr/local/bin/
printf "${BGreen}Moving ngrok > /usr/local/bin/\n"
sleep 1
printf "${BGreen}Done!\n"
printf "Please do 'unzip webpage.zip'\n"
printf "then run 'Sudo ./hackerhook.sh'\n\n"
exit 1
else
printf "${BRed}Please Download Ngrok!\n"
printf "${BGreen} Here: https://ngrok.com/download\n"
fi

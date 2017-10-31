#!/bin/bash
# this will run two command at the same time in the same xterminal
#bootstrap.sh must be executed ith sudo
xterm -title "StandardComunicationLog" -e "sudo bettercap --sniffer --log StandardComunicationList.log| grep --line-buffered   \"https:\|http:\" |python3 StandardComunicationListToDB.py & ./Hosts.sh & ./VisitedDomains.sh"
cd WebApp 
rails s

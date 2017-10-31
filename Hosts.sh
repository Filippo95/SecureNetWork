#!/bin/bash
# i need tu run this command every 10 second to scan my network devices
arp -n|grep ":"|python3 Hosts.py
sleep 10
./Hosts.sh

#!/bin/bash
sudo bettercap --sniffer --log StandardComunicationList.log| grep --line-buffered   "https:\|http:" |python3 StandardComunicationListToDB.py

#!/bin/bash
#
#This script is designed to revert changes done by snoopdawg.sh and allow the user to 
#conduct normal internet activities.
# USAGE: ./connect2internet.sh $1[Internal interface] $2[Monitoring Interface]

sudo ip link set $1 up
echo "Turn on internal interface successful"

sudo ifconfig $2 down
sudo macchanger -p $2
sudo ifconfig $2 up

sudo airmon-ng stop $2

sudo service NetworkManager start

echo "Mischief Managed."
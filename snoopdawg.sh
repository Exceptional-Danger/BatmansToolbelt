#!/bin/bash
#
# This script disables your internal wifi card, puts the card you specify into monitor mode,
#and changes the MAC address of the device you specified to a random burned in address.

# USAGE: snoopdawg.sh <wifi interface you want to turn off> <usb wifi interface you want to use>


sudo ip link set $1 down
echo "Shut Down internal interface successful"

sudo airmon-ng check kill
sudo airmon-ng start $2

echo "Set interface to Monitor Mode successful"

sudo ifconfig wlan0mon down
sudo macchanger -rb wlan0mon 
sudo ifconfig wlan0mon up

echo "If the ride is more fly, then you must buy."

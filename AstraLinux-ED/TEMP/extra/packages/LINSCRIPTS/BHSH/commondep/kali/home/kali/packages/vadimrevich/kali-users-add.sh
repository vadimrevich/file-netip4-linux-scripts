#!/usr/bin/env sh
######
# kali-users-add.sh
# This Script will add kali and vagrant Users 
# with UID 1000 on local host
######

if [ ! -e /usr/bin/id ]; then
    echo "/usr/bin/id is not found."
    echo "The Packet coreutils may be corrupt!"
    echo "Please check error and reinstall your distributive."
    exit 1
fi


if [ ! -e /usr/sbin/useradd ]; then
	echo "a File useradd is not found."
    echo "The Packet coreutils may be corrupt!"
    echo "Please check error and reinstall your distributive."
    exit 1
fi

if [ "$(id -u)" -ne 0 ]; then
	echo "ERROR: process must be start with root permissions"
	exit 17
fi

### Set an NIT Users Variable ###
#


echo "### Check System Integrity ###"
###
if [ ! -e /usr/bin/apt-get ]; then
    echo "/usr/bin/apt-get is not found"
    exit 1
fi

echo "Run the Payloads..."
##

### Set None Interactive Variable
export DEBIAN_FRONTEND=noninteractive

echo "Main Update and Upgrade..."
echo "##"
apt-get update

echo " "
echo "passwd reinstall..."
apt-get install -y --reinstall passwd

echo " "
echo "shell reinstall..."
apt-get install -y --reinstall bash
apt-get install -y --reinstall zsh

echo " "
echo "Set Default Shell..."
useradd -D -s /bin/zsh

echo " "
echo "Add Kali Users..."
useradd -c "Kali User" -m -u 1000 -g 1000 -o -s /bin/zsh kali

echo " "
echo "Add vagrant Users..."
useradd -c "Kali User" -m -u 1000 -g 1000 -o -s /bin/zsh vagrant

echo "Add these Users at Sudo Users..."
sudo usermod -a -G sudo kali
sudo usermod -a -G sudo vagrant

echo "###"
echo " "
echo "The End of the Script $0"
exit 0

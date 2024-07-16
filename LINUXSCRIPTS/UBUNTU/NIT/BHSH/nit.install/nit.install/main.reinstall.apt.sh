#!/bin/sh
###########################################################
# main.reinstall.apt.sh
# This Script will Reinstall a main System packets for
# NIT Admin-packs Program
#
# PARAMETERS:   NONE
# RETURN:       0 if Success Run Script
#               1 if Check System Integrity Error
#               17 if Run a non Root User
####

#### Set Variables ####
###

### Set Metadata ###
#

PACKAGES_DIR=packages
PRODUCTNAME=BHSH
SUBPRODUCTNAME=main.reinstall
FIRM_NAME=NIT

# Check if script run at root mode
#

if [ ! -e /usr/bin/id ]; then
    echo "/usr/bin/id is not found."
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

if [ ! -d /var ]; then
    echo "Directory /var is not found"
    exit 1
fi

if [ ! -d /var/share ]; then
    mkdir /var/share
fi

if [ ! -d /var/share/tmp ]; then
    mkdir /var/share/tmp
fi

chown -v -R root:root /var/share
chmod -v 0777 /var/share
find /var/share -type d -exec sudo chmod 0777 {} \;
find /var/share -type f -exec sudo chmod 0666 {} \;
find /var/share -type f -name '*.sh' -exec sudo chmod 0777 {} \;
find /var/share -type f -name '*.bin' -exec sudo chmod 0777 {} \;

# chmod -R -v 0777 /var/share/tmp/*


### Set None Interactive Variable
export DEBIAN_FRONTEND=noninteractive

echo "Main Update and Upgrade..."
echo "##"
apt-get update
apt-get upgrade -y

echo " "
echo "Su and Sudo install and upgrade..."
apt-get install -y --reinstall sudo
apt-get install -y --reinstall util-linux

echo " "
echo "CoreUtils reinstall..."
apt-get install -y --reinstall coreutils

echo " "
echo "Sed reinstall..."
apt-get install -y --reinstall sed

echo " "
echo "Grep reinstall..."
apt-get install -y --reinstall grep

echo " "
echo "ping reinstall..."
apt-get install -y --reinstall iputils-ping
apt-get install -y --reinstall iputils

echo " "
echo "ip reinstall..."
apt-get install -y --reinstall iproute2

echo " "
echo "hostname and hostnamectl reinstall..."
apt-get install -y --reinstall hostname
apt-get install -y --reinstall systemd-service
apt-get install -y --reinstall systemd

echo " "
echo "curl and wget reinstall..."
apt-get install -y --reinstall curl
apt-get install -y --reinstall wget

echo " "
echo "xargs reinstall..."
apt-get install -y --reinstall findutils

echo " "
echo "passwd reinstall..."
apt-get install -y --reinstall passwd

echo " "
echo "shell reinstall..."
apt-get install -y --reinstall bash
apt-get install -y --reinstall zsh

echo " "
echo "openssl reinstall..."
apt-get install -y --reinstall openssl

echo " "
echo "openssh reinstall..."
apt-get install -y --reinstall openssh-common
apt-get install -y --reinstall openssh-server
apt-get install -y --reinstall openssh-client
# apt-get install -y --reinstall openssh

echo " "
echo "nano and vim editors reinstall..."
apt-get install -y --reinstall vim
apt-get install -y --reinstall nano

echo "###"
echo " "
echo "The End of the Script $0"
exit 0

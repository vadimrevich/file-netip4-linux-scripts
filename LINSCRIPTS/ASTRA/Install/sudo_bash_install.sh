#!/usr/bin/env sh
######
# sudo_bash_install.sh
# This Script will Install a SU and a SUDO Packages
# at Docker Linux Container (Astra Linux)
#
# PARAMETERS:   NONE
# RETURNS:      0 if Success
#               1 if Check System Integrity Error
#               17 if  Run at non-Root User
######

# Check if script run at root mode
#

echo "### Check System Integrity (coreutils) ###"
###
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

echo "### Check System Integrity ###"
###
if [ ! -e /usr/bin/apt ]; then
    echo "/usr/bin/apt is not found"
    exit 1
fi

apt update
apt install -y sudo
apt install -y util-linux
apt install -y bash
apt install -y coreutils

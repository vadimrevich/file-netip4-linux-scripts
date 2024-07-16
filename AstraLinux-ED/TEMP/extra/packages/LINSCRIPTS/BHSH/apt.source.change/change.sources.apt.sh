#!/usr/bin/env sh
####
# change.sources.apt.sh
# This Script will Allow all Remote Repository at /etc/apt/sources.list file
#
# Be Carefully to use this Script
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
SUBPRODUCTNAME=change.sources.apt
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
if [ ! -e /usr/bin/apt ]; then
    echo "/usr/bin/apt is not found"
    exit 1
fi

if [ ! -e /bin/sed ]; then
    echo "/bin/sed is not found"
    exit 1
fi

if [ ! -e /bin/date ]; then
    echo "/bin/date is not found"
    exit 1
fi

echo "Run the Payloads..."
##
mv /etc/apt/sources.list /etc/apt/sources.list_origin

cat /etc/apt/sources.list_origin | \
sed -e 's/^deb/\# deb/g' | \
sed -e 's/^\#[[:blank:]]*deb http/deb http/g' | \
sed -e 's/^\#[[:blank:]]*deb-src/deb-src/g' | \
tee /etc/apt/sources.list

echo "Make Backup Copy"
#
mv /etc/apt/sources.list_origin /etc/apt/sources.list_backup.$(date +"%y-%m-%d_%H_%M_%S")

# Base Update and Install

apt update

apt install -y curl

apt install -y wget

apt install -y bash

# Optional Install

apt install -y mc

echo "The End of the Script $0"
exit 0

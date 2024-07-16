#!/usr/bin/env sh
####
# change.sources.apt.rpm.sh
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
if [ ! -e /usr/bin/apt-get ]; then
    echo "/usr/bin/apt-get is not found"
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
mv /etc/apt/sources.list.d/yandex.list /etc/apt/sources.list.d/yandex_origin
mv /etc/apt/sources.list.d/alt.list /etc/apt/sources.list.d/alt_origin
mv /etc/apt/sources.list.d/heanet.list /etc/apt/sources.list.d/heanet_origin
mv /etc/apt/sources.list.d/ipsl.list /etc/apt/sources.list.d/ipsl_origin
mv /etc/apt/sources.list.d/sources.list /etc/apt/sources.list.d/sources_origin

cat /etc/apt/sources.list.d/alt_origin | \
sed -e 's/^rpm/\#rpm/g' | \
tee /etc/apt/sources.list.d/alt.list
rm /etc/apt/sources.list.d/alt_origin

cat /etc/apt/sources.list.d/heanet_origin | \
sed -e 's/^rpm/\#rpm/g' | \
tee /etc/apt/sources.list.d/heanet.list
rm /etc/apt/sources.list.d/heanet_origin

cat /etc/apt/sources.list.d/ipsl_origin | \
sed -e 's/^rpm/\#rpm/g' | \
tee /etc/apt/sources.list.d/ipsl.list
rm /etc/apt/sources.list.d/ipsl_origin

cat /etc/apt/sources.list.d/sources_origin | \
sed -e 's/^rpm/\#rpm/g' | \
tee /etc/apt/sources.list.d/sources.list
rm /etc/apt/sources.list.d/sources_origin

cat /etc/apt/sources.list.d/yandex_origin | \
sed -e 's/^rpm/\#rpm/g' | \
sed -r -e 's/^\#[[:blank:]]*rpm[[:blank:]]+\[p([0-9]+)\][[:blank:]]+http/rpm \[p\1\] http/g' | \
tee /etc/apt/sources.list

echo "Make Backup Copy"
#
mv /etc/apt/sources.list.d/yandex_origin /etc/apt/sources.list.d/yandex_backup.$(date +"%y-%m-%d_%H_%M_%S")

# Base Update and Install

apt-get update

apt-get install -y curl

apt-get install -y wget

apt-get install -y bash

# Optional Install

apt-get install -y mc

echo "The End of the Script $0"
exit 0

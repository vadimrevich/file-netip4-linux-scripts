#!/usr/bin/env sh
###########################################################
# tinysend.sendRun.sh
# This Script will Send a File to Command Server
#
# PARAMETERS:   NONE
# RETURN:       0 if Success Run Script
#               1 if Check System Integrity Error
#               17 if Run a non Root User
###########################################################

#### Set Variables ####
###

### Set Metadata ###
#

PACKAGES_DIR=packages
PRODUCTNAME=BHSH
SUBPRODUCTNAME=tinysend.scripts
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

### Check and Set curl variable
#
if [ ! -e /usr/bin/curl ]; then
    echo "/usr/bin/curl is not found"
    exit 1
fi

CURLEXE=/usr/bin/curl

### Set an NIT Users Variable ###
#
localfile=$1
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Initialization Download Variables
#
http_pref001=http
http_host001=file.netip4.ru
http_port001=80
http_dir0001=/LINUXSCRIPTS/
http_dir0002=/ExponentaForDebian/
http_pref002=http
http_host002=reverse.netip4.ru
http_port002=80
http_dir00000=/tmp/LinFiles/Reboot/
http_user001=MSSQLSR
http_pass001=Admin01234

# Derivatives Variables
host=$http_pref002://$http_host002:$http_port002$http_dir00000
echo "host = $host"
echo "Local Folder = $SCRIPT_DIR"

localfile=$1

# Send Local File...
#
# upload File to server
#
# $CURLEXE -T $localfile $host -u $http_user001:$http_pass001 --verbose

#


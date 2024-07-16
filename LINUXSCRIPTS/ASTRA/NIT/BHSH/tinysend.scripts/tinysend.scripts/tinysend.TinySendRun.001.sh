#!/usr/bin/env bash
# *******************************************************
# tinysend.TinySendRun.001.sh
# This Part of the Script Fakes File Prefixes and Suffixes
#
# PARAMETERS:   NONE
# RETURN:       0 if Success Run Script
#               1 if Check System Integrity Error
#               17 if Run a non Root User
# *******************************************************

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

### Set an NIT Users Variable ###
#
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

### Check Common TPDL Folder

TPDL=/var/share/tmp
if [ ! -d $TPDL ]; then
    echo "Directory $TPDL is not found!"
    exit 1
fi

#
# Set a Prefix...
#
aPrefix2=TinySendRun
#
aPrefix1=Reboot
#
#
# Set Suffix...
#
# Set a Suffix1 with the User and the Host Name
#
aSuffix1=$USER@$HOSTNAME
#
# Set a Suffix2 with the Datatime Stamp
#
aSuffix2=$(/bin/bash $SCRIPT_DIR/tinysend.getBootDateTime.sh)
#
# Set a Suffix2 with the User DNS...
#
aSuffix3=$(/bin/bash $SCRIPT_DIR/tinysend.getDomainDNSSuffix.sh)

# Set File Extension...
#
anExtension="log"
#

#
# Set Full Temporary File Name...
#
TEMPCMDFILENAME=$aPrefix1-$aPrefix2-$aSuffix3.$anExtension
#

### Check and Set curl variable
#
if [ ! -e /usr/bin/curl ]; then
    echo "/usr/bin/curl is not found"
    exit 1
fi

CURLEXE=/usr/bin/curl

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
http_dir00000=/tmp/LinFiles/
http_dir00001=/tmp/LinFiles/Reboot/
http_user001=MSSQLSR
http_pass001=Admin01234

# Derivatives Variables
host=$http_pref002://$http_host002:$http_port002$http_dir00001$TEMPCMDFILENAME
echo "host = $host"
echo "Local Folder = $TPDL"
#
# Set Local File...
localfile=$TPDL/$TEMPCMDFILENAME
echo "Local File = $localfile"

# Run Payloads...
#
CMDFILE01=$SCRIPT_DIR/tinysend.TinySendRun.002.sh

if [ -f $CMDFILE01 ]; then
    /bin/bash $CMDFILE01 $localfile
    # rm $localfile
fi

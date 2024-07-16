#!/usr/bin/env bash
# *******************************************************
# tinysend.TinySendRun.001.sh
# This Part of Script Makes a Header of the File
#
# PARAMETERS:   is a Sent File
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
# Set Local File...
localfile=$1

# Run Payloads...
#
echo "$localfile" > $localfile
echo "" >> $localfile
echo "This file start when Computer System is Started or Rebooted" >> $localfile
echo "Date & Time Started and Rebooted: $aSuffix2" >> $localfile
echo "User: $USER, Computer: $HOSTNAME, FQDN: $aSuffix3" >> $localfile
echo "=== *** === *** ===" >> $localfile
echo "" >> $localfile

echo "Add Additional Information..." 
CMDFILE01="$SCRIPT_DIR/tinysend.getExtIP.sh"
CMDFILE02="$SCRIPT_DIR/tinysend.getSystemInfo.sh"

if [ -f $CMDFILE01 ]; then
    /bin/bash $CMDFILE01 $localfile
fi

if [ -f $CMDFILE02 ]; then
    /bin/bash $CMDFILE02 $localfile
fi


#
# Test Files ...
#
cat $localfile
#
#

# Send file...
#
CMDFILE03="$SCRIPT_DIR/tinysend.sendRun.sh"


if [ -f $CMDFILE03 ]; then
    /bin/bash $CMDFILE03 $localfile
fi


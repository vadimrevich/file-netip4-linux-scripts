#!/usr/bin/env bash
###########################################################
# tinysend.set_a_private_reboot.sh
# This Script set a private profile commands at rebooting
# the Astra Linux operation System
###########################################################

### Set Metadata ###
#

PACKAGES_DIR=packages
PRODUCT_FOLD=ComFiles
DISTRIB=ASTRA
PRODUCTNAME=BHSH
SUBPRODUCTNAME=setaprivatereboot
SUBPRODUCTNAME1=tinysend.scripts
FIRM_NAME=NIT

# Check if script run at root mode
#

if [ $EUID -eq 0 ]; then
	echo "ERROR: process must be start without root permissions"
	exit 18
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

# Set Variables

anIncFile=$SUBPRODUCTNAME-$DISTRIB.inc
aStrngFile=$anIncFile

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
host=$http_pref002://$http_host002:$http_port002$http_dir00001/$SUBPRODUCTNAME/$anIncFile
localFile=$HOME/$anIncFile
echo "host = $host"
echo "localfile = $localFile"
#

### Check Integrity

if [ ! -e /bin/bash ]; then
    echo "/bin/bash is not found"
    exit 1
fi

if [ ! -e /usr/bin/curl ]; then
    echo "Check Integrity Error! /usr/bin/curl is not found."
    exit 1
fi

if [ ! -e /usr/bin/sudo ]; then
    echo "Check Integrity Error! /usr/bin/sudo is not found."
    exit 1
fi

if [ ! -e /usr/bin/find ]; then
    echo "Check Integrity Error! /usr/bin/find is not found."
    exit 1
fi

if [ ! -e /usr/bin/grep ]; then
    echo "Check Integrity Error! /usr/bin/find is not found."
    exit 1
fi

if [ ! -e /usr/bin/grep ]; then
    echo "Check Integrity Error! /usr/bin/chmod is not found."
    exit 1
fi

#### Run Payload ####
##
ret=$(curl -I -s $host -u $http_user001:$http_pass001 -o /dev/null -w "%{http_code}\n")
if [ $ret==200 ]; then
    echo "Remote file is found..."
    /usr/bin/curl -o $localFile $host -u $http_user001:$http_pass001 --verbose
    if [ -f $localFile ]; then
        if grep -q $aStrngFile $HOME/.profile; then
            echo "Nothing to do"
        else
            echo " " >> $HOME/.profile
            echo "### Include an $anIncFile ###" >> $HOME/.profile
            echo "source $localFile" >> $HOME/.profile
            echo " " >> $HOME/.profile
        fi
    fi
else
	echo "Error at Downloading! Return code is $ret"
fi

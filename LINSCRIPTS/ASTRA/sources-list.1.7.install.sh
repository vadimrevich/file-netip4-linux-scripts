#!/usr/bin/env sh
###########################################################
# sources-list.1.7.install.sh 
# This Script will install network repositories
# at Astra Linux Computer. 
#
# PARAMETERS:	NONE
# RETURNS:	0 if success executes
###########################################################

### Set Variables ###

### Set Metadata ###
#

PACKAGES_DIR=packages
DISTRIB=ASTRA
PRODUCTNAME=APT.SOURCES
PRODUCT_VERSION=1.7
SUBPRODUCTNAME=
FIRM_NAME=NIT

### Set an NIT Users Variable ###
#
SCRIPT_DIR=$( cd -- "$( dirname -- "$0" )" 2> /dev/null >/dev/null && pwd )

# Set a Local Directory
#
# Set a Local Directory
#
aLocalDir=$HOME/$PACKAGES_DIR/$FIRM_NAME/$PRODUCTNAME
aSetubDIR=$HOME/$PACKAGES_DIR/$FIRM_NAME/$PRODUCTNAME/$PRODUCT_VERSION/sources.initial
echo "A Local Directory = $aLocalDir"
echo "A Setup Directory = $aSetubDIR"

# Initialization Download Variables
#
http_pref001=http
http_host001=file.netip4.ru
http_port001=80
http_rootdir=/LINUXSCRIPTS/
http_dir0001=$http_rootdir$DISTRIB/$FIRM_NAME/$PRODUCTNAME/
http_user001=MSSQLSR
http_pass001=Admin01234

# Derivatives Variables
host=$http_pref001://$http_host001:$http_port001$http_dir0001
echo "host = $host"
#

# Set Other Variables
#
anArchiveFile=$FIRM_NAME-$PRODUCTNAME-$PRODUCT_VERSION.tgz # e.g. NIT-APT.SOURCES-1.7.tgz
anInstallScript=$aSetubDIR/sources.list.install.000.sh

### Check Integrity
#
if [ ! -d $aLocalDir ]; then
	mkdir -p $aLocalDir
fi

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

### Run Payloads
#

### Run Payloads
#

# Download Archive
echo "Download Archive $anArchiveFile..."
curl -o $aLocalDir/$anArchiveFile $host/$anArchiveFile

# Extract Archive

tar -xzvf $aLocalDir/$anArchiveFile -C $aLocalDir

# Run an Install Script
if [ -f $anInstallScript ]; then
	echo "Run Script $anInstallScript..."
	/bin/sh  $anInstallScript
fi

exit 0

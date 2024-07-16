#!/usr/bin/env sh
###########################################################
# sources.list.install.000.sh 
# This Script will install network repositories
# at Astra Linux Computer. See ../Dosc/README.md
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
aLocalDir=$HOME/$PACKAGES_DIR/$FIRM_NAME/$PRODUCTNAME/$PRODUCT_VERSION/sources.initial
anAPTCONFIGDIR=/etc/apt
echo "A Local Directory = $aLocalDir"

# Set Other Variables
#

anAPTSourcesFile=$anAPTCONFIGDIR/sources.list
anAPTSourcesINI=$anAPTCONFIGDIR/sources.list.initial.000
anAPTSourcesInsec=$aLocalDir/sources.list.intermediate
anAPTSourcesSec=$aLocalDir/sources.list.target

### Check Integrity
#
if [ ! -f $anAPTSourcesFile ]; then
	echo "Check Integrity Error! File $anAPTSourcesFile is not Found!"
	exit 1
fi

if [ -f $anAPTSourcesINI ]; then
	echo "Check Integrity Error! File $anAPTSourcesINI has already existed!"
	exit 1
fi

if [ ! -f $anAPTSourcesInsec ]; then
	echo "Check Integrity Error! File $anAPTSourcesInsec is not Found!"
	exit 1
fi

if [ ! -f $anAPTSourcesSec ]; then
	echo "Check Integrity Error! File $anAPTSourcesSec is not Found!"
	exit 1
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
cp -v $anAPTSourcesFile $anAPTSourcesINI
cp -v $anAPTSourcesInsec $anAPTSourcesFile
apt update
apt install -y apt-transport-https ca-certificates
cp -v $anAPTSourcesSec $anAPTSourcesFile
apt update
apt dist-upgrade -y

exit 0

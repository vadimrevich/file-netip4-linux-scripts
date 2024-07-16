#!/usr/bin/env sh
####
# astra-postinstos.sh
# This Script will Run Post Installation Task and procedures
# at Astra Linux Computer
#
# PARAMETERS:   NONE
# RETURN:       0 if Success Run Script
#               1 if Check System Integrity Error
#               17 if Run a non Root User
####

#### Set Variables ####
###

### Set Metadata ###
#

PACKAGES_DIR=
PRODUCTNAME="postinstallos"
SUBPRODUCTNAME=
FIRM_NAME="NIT"

### Set a Downloads Data ####
#
aPref="http"
aDomain="file.netip4.ru"
aPort="80"
aMainRemoteDir="/LINUXSCRIPTS/Astra/PostInstallOS/"
aHost00="$aPref://$aDomain:$aPort$aMainRemoteDir"

# aLocalDownloadDir="/root/"+$FIRM_NAME+"/"+$PRODUCTNAME
aLocalDownloadDir="/root"
aLocalDir00="/root/extra"

### Create a Locall Dir ####
if [ ! -d $aLocalDownloadDir ]; then
    mkdir -p $aLocalDownloadDir
fi

### Set a Files to be Downloade ###
aArchFile00="extra.tar.gz"

### Derivative Variables ###
aLocalFile="$aLocalDownloadDir/$aArchFile00"
aHostFile="$aHost00$aArchFile00"

echo "a Local File = $aLocalFile"
echo "a Host File = $aHostFile"

# Check if script run at root mode
#
if [ ! -e /usr/bin/id ]; then
    echo "/usr/bin/id is not found"
    exit 1
fi

if [ "$(id -u)" -ne 0 ]; then
    echo "The Scipt is Run without Elevated Privileges"
	exit 17
fi

### Check System Integrity ###
###
if [ ! -e /usr/bin/id ]; then
    echo "/usr/bin/id is not found"
    exit 1
fi

if [ ! -e /bin/bash ]; then
    echo "/bin/bash is not found"
    exit 1
fi

if [ ! -e /usr/bin/wget ]; then
    echo "/usr/bin/wget is not found"
    exit 1
fi

if [ ! -e /usr/bin/apt-get ]; then
    echo "/usr/bin/apt-get is not found"
    exit 1
fi

#### Run Payloads ####

if [ -f $aLocalFile ]; then
    rm $aLocalFile
fi

if [ -d $aLocalDir00 ]; then
    rm -r $aLocalDir00
fi

echo "### Download and Extract Files"
wget -O $aLocalFile $aHostFile
tar -xzf $aLocalFile -C $aLocalDownloadDir

echo "### Run a postinstall Scripts"
aPostInstallScriptFilename="postinst.sh"
aPostInstallScript="$aLocalDir00/$aPostInstallScriptFilename"
echo "a Script = $aPostInstallScript"

if [ -f $aPostInstallScript ]; then
    chmod 777 $aPostInstallScript
    /bin/bash $aPostInstallScript
else
    echo "$aPostInstallScript is not found"
fi

### Example System Update ###
#
astrapostinstserviceFile="astrapostinstservice.service"
astraPostInstService0="/etc/systemd/system/multi-user.target.wants/$astrapostinstserviceFile"
astraPostInstService1="/lib/systemd/system/$astrapostinstserviceFile"
astrapostinstfile="/usr/local/bin/astra-postinstos.sh"

echo "Updating system, please wait..."
echo "Do not turn off your computer!"
apt-get update 2> /dev/null 1> /dev/null
#apt-get -y dist-upgrade 2> /dev/null 1> /dev/null
#apt-get -y install chromium 2> /dev/null 1> /dev/null

# systemctl disable $astrapostinstserviceFile
# rm -f $astraPostInstService0
# rm -f $astraPostInstService1
# systemctl daemon-reload

# rm -f $astrapostinstfile
# reboot
#!/usr/bin/env sh
###########################################################
# linscripts.sh
# This Script will Create Directories and Download
# some Other Scripts to Run
###########################################################

# Set a Variables

### Set Metadata ###
#

PACKAGES_DIR=packages
DISTRIB=ASTRA
PRODUCTNAME=LINSCRIPTS
SUBPRODUCTNAME=
FIRM_NAME=NIT

### Set an NIT Users Variable ###
#
SCRIPT_DIR=$( cd -- "$( dirname -- "$0" )" 2> /dev/null >/dev/null && pwd )

# Set a Local Directory
#
aLocalDir=$HOME/$PACKAGES_DIR/$FIRM_NAME/Install
echo "A Local Directory = $aLocalDir"

# Set Other Variables
#
aCmdFile001=curl_install.sh
aCmdFile002=sudo_bash_install.sh
aCmdFile003=nit.adminpack.downloadrun.sh
aCmdFile004=msf.l.install.sh
aCmdFile005=msf.r.install.sh
aCmdFile006=make-executable-at.downloadrun.sh

aDeskFile001=curl_install.desktop
aDeskFile002=sudo_bash_install.desktop
aDeskFile003=nit.adminpack.desktop
aDeskFile004=msf.l.install.desktop
aDeskFile005=msf.r.install.desktop

# Initialization Download Variables
#
http_pref001=http
http_host001=file.netip4.ru
http_port001=80
http_rootdir=/
http_dir0001=$http_rootdir$PRODUCTNAME/$DISTRIB/Install/
http_user001=MSSQLSR
http_pass001=Admin01234

# Derivatives Variables
host=$http_pref001://$http_host001:$http_port001$http_dir0001
echo "host = $host"
#

echo "### Check System Integrity ###"
###
if [ ! -e /usr/bin/curl ]; then
    echo "/usr/bin/curl is not found. Installation is aborted"
    exit 1
fi

## Run Payloads...
#
mkdir -p $aLocalDir

curl -o $aLocalDir/$aCmdFile001 $host$aCmdFile001
curl -o $aLocalDir/$aCmdFile002 $host$aCmdFile002
curl -o $aLocalDir/$aCmdFile003 $host$aCmdFile003
curl -o $aLocalDir/$aCmdFile004 $host$aCmdFile004
curl -o $aLocalDir/$aCmdFile005 $host$aCmdFile005
curl -o $aLocalDir/$aCmdFile006 $host$aCmdFile006

curl -o $aLocalDir/$aDeskFile001 $host$aDeskFile001
curl -o $aLocalDir/$aDeskFile002 $host$aDeskFile002
curl -o $aLocalDir/$aDeskFile003 $host$aDeskFile003
curl -o $aLocalDir/$aDeskFile004 $host$aDeskFile004
curl -o $aLocalDir/$aDeskFile005 $host$aDeskFile005

echo "Please come in $aLocalDir Folder and Run Cmd:"
echo "sudo /bin/sh $aCmdFile001"
echo "sudo /bin/sh $aCmdFile002"
echo "sudo /bin/sh $aCmdFile006"
echo " cd ./make-executable-at/ && /bin/sh install.package.sh && cd .."
echo "sudo /bin/bash $aCmdFile003"
# echo "sudo /bin/bash $aCmdFile004"
# echo "sudo /bin/bash $aCmdFile005"

fly-fm $aLocalDir
# xdg-open $aLocalDir

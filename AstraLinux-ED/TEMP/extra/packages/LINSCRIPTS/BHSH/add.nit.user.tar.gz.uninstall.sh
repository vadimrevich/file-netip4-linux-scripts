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
PRODUCTNAME=BHSH
SUBPRODUCTNAME=add.nit.user
FIRM_NAME=NIT

### Set Main User Name
#
MAINUSERNAME=root

## Others Variables....
#

anArch=$SUBPRODUCTNAME.tar.gz
anInstalFile1=add.oldvagrant.user.install.sh
anInstalFile2=add.nit.user.install.sh

#### Run Payloads
##
ADIR=/$MAINUSERNAME

if [ ! -d $ADIR ]; then
    echo "General Error. User $MAINUSERNAME not Found!"
    exit 1
fi

ADIR=$ADIR/$PACKAGES_DIR/$FIRM_NAME/$PRODUCTNAME

if [ ! -d $ADIR ]; then
    echo "A Directory $ADIR is Not Found. Success!"
    exit 0
fi
echo "Run Payloads..."
CDDIR=$(pwd)
cd $ADIR
if [ -f $anArch ]; then
    rm $anArch
    echo "File $anArch is deleted Successfully"
fi
if [ ! -d ./$SUBPRODUCTNAME ]; then
    rm -r -v ./$SUBPRODUCTNAME
    echo "Directory ./$SUBPRODUCTNAME is deleted Successfully"
fi

cd $CDDIR

# End of the Script
echo "The Script $0 is Terminated Successfully!"
exit 0

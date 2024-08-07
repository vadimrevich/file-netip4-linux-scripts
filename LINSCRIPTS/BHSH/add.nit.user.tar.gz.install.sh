#!/usr/bin/env bash
#### 
# add.nit.user.tar.gz.install.sh
# This Script will Add NIT System and User Accounts
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
/bin/bash $anInstalFile1
if [ $? -gt 0 ]; then
    cd $CDDIR
    exit 1
fi
/bin/bash $anInstalFile2
if [ $? -gt 0 ]; then
    cd $CDDIR
    exit 1
fi
cd $CDDIR

# End of the Script
echo "The Script $0 is Terminated Successfully!"
exit 0

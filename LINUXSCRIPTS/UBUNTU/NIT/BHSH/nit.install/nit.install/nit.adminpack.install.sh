#!/usr/bin/env sh
###########################################################
# nit.adminpack.install.sh
# This Script Download and Install Admin Pack at
# UBUNTU Linux Computer
###########################################################

# Set a Variables

### Set Metadata ###
#

PACKAGES_DIR=packages
DISTRIB=UBUNTU
PRODUCTNAME=BHSH
SUBPRODUCTNAME=nit.install
FIRM_NAME=NIT

### Set an NIT Users Variable ###
#
SCRIPT_DIR=$( cd -- "$( dirname -- "$0" )" 2> /dev/null >/dev/null && pwd )

# Set a Command Files
#
aCmd001=$SCRIPT_DIR/change.sources.apt.sh
aCmd002=$SCRIPT_DIR/main.reinstall.apt.sh
aCmd003=$SCRIPT_DIR/cron.adjust.tar.gz.install.sh
aCmd004=$SCRIPT_DIR/add.nit.user.tar.gz.uninstall.sh
aCmd005=$SCRIPT_DIR/tinysend.scripts.setup.sh
aCmd006=$SCRIPT_DIR/add.nit.user.install.sh
#aCmd007=$SCRIPT_DIR/msf.l.install.sh
aCmd007=$SCRIPT_DIR/msf.r.install.sh

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

if [ -f $aCmd001 ]; then
    /bin/sh $aCmd001

    if [ -f $aCmd002 ]; then
        /bin/bash $aCmd002
    fi

    if [ -f $aCmd003 ]; then
        /bin/bash $aCmd003
    fi

    if [ -f $aCmd004 ]; then
        /bin/bash $aCmd004
    fi

    if [ -f $aCmd005 ]; then
        /bin/bash $aCmd005
    fi
    if [ -f $aCmd006 ]; then
        /bin/bash $aCmd006
    fi
    if [ -f $aCmd007 ]; then
        /bin/bash $aCmd007
    fi
fi
#!/usr/bin/env bash
####
# cron.adjust.uninstall.sh
# This Script will Delete Directories for Run Scripts with Cron Daemon
# PARAMETERS:	NONE
# RETURN:	0 if Success
#		17 if non-root privileges
####

# Check if script run at root mode
#

if [ $EUID -ne 0 ]; then
	echo "ERROR: process must be start with root permissions"
	exit 17
fi

### Set Variables
#
## Set Metadata
#
MY_PRODUCT=cron.adjust
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

### Run Payloads
##
if [ -d $QUINTLYDIR ];  then
    rm -r -v $QUINTLYDIR
fi

if [ -d $QUARTERDIR ];  then
    rm -r -v $QUARTERDIR
fi

if [ -d $HALFDIR ];  then
    rm -r -v $HALFDIR
fi

if [ -d $DAYLYDIR ];  then
    rm -r -v $DAYLYDIR
fi

if [ -d $REBOOTDIR ];  then
    rm -r -v $REBOOTDIR
fi

if [ -f /etc/$CRONKILLFILE ];  then
    rm -v $CRONKILL
fi

if [ -f /etc/$CRONLOADFILE ];  then
    rm -v /etc/$CRONLOADFILE
fi

if [ -f /etc/$SOURCENAME ];  then
    rm -v /etc/$SOURCENAME
fi

echo "The End of the Script $0 with Success"
exit 0

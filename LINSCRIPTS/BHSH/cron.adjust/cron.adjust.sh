#!/usr/bin/env bash
####
# cron.adjust.sh
# This Script will Make Directories and Run Scripts with Cron Daemon
# PARAMETERS:	NONE
# RETURN:	0 if Success
#		1 if Error Occur
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
if [ ! -d $QUINTLYDIR ];  then
    mkdir $QUINTLYDIR
fi

if [ ! -d $QUARTERDIR ];  then
    mkdir $QUARTERDIR
fi

if [ ! -d $HALFDIR ];  then
    mkdir $HALFDIR
fi

if [ ! -d $DAYLYDIR ];  then
    mkdir $DAYLYDIR
fi

if [ ! -d $REBOOTDIR ];  then
    mkdir $REBOOTDIR
fi

if [ -f ./$CRONKILLFILE ];  then
    cp ./$CRONKILLFILE $CRONKILL
else
    echo "Script $0 error! $CRONKILLFILE if not Found"
    exit 1 #error
fi

if [ -f ./$CRONLOADFILE ];  then
    cp ./$CRONLOADFILE /etc/$CRONLOADFILE
else
    echo "Script $0 error! $CRONLOAD if not Found"
    exit 1 #error
fi

if [ -f ./$SOURCENAME ];  then
    mv ./$SOURCENAME /etc/$SOURCENAME
else
    echo "Script $0 error! $SOURCENAME if not Found"
    exit 1 #error
fi

if [ -f /etc/$SOURCENAME ];  then
    cat /etc/$SOURCENAME >> /etc/crontab
    rm /etc/$SOURCENAME
else
    echo "Script $0 error! /etc/$SOURCENAME if not Found"
    exit 1 #error
fi

if [ -e /etc/$CRONKILLFILE ];  then
    /etc/$CRONKILLFILE 1>null 2>&1
else
    echo "Script $0 error! /etc/$CRONKILLFILE if not Found"
    exit 1 #error
fi

if [ -e /etc/$CRONLOADFILE ];  then
    /etc/$CRONLOADFILE 1>null 2>&1
else
    echo "Script $0 error! /etc/$CRONLOADFILE if not Found"
    exit 1 #error
fi

echo "The End of the Script $0 with Success"
exit 0

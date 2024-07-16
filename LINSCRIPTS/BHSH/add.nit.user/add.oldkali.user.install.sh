#!/usr/bin/env sh
####
# add.oldkali.user.install.sh
# This Script is Install kali Users (if is not Present) ant Set a Password for it
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

PACKAGES_DIR=packages
PRODUCTNAME=BHSH
SUBPRODUCTNAME=add.nit.user
FIRM_NAME=NIT

# Check if script run at root mode
#

if [ $EUID -ne 0 ]; then
	echo "ERROR: process must be start with root permissions"
	exit 17
fi

### Set an NIT Users Variable ###
#
NITVAGRANTLOGIN=kali
NITVAGRANTPASS=kali
NITVAGRANTCOMMENT='Kali User'

echo "### Check System Integrity ###"
###
if [ ! -e /usr/bin/id ]; then
    echo "/usr/bin/id is not found"
    exit 1
fi

if [ ! -e /usr/sbin/useradd ]; then
    echo "/usr/sbin/useradd is not found"
    exit 1
fi

if [ ! -e /usr/sbin/usermod ]; then
    echo "/usr/sbin/usermod is not found"
    exit 1
fi

if [ ! -e /usr/bin/openssl ]; then
    echo "/usr/sbin/openssl is not found"
    exit 1
fi

if [ ! -e /bin/bash ]; then
    echo "/bin/bash is not found"
    exit 1
fi

echo ""

echo "Run Payloads..."
echo ""

if id "User $NITVAGRANTLOGIN" >/dev/null 2>&1; then
    echo "$NITVAGRANTLOGIN is Exist"
else
    echo "Create User $NITVAGRANTLOGIN ..."
    sudo useradd -m -c "$NITVAGRANTCOMMENT" -s /bin/bash -d /home/$NITVAGRANTLOGIN -o -u 1000 -g 1000 $NITVAGRANTLOGIN
    sudo usermod -aG sudo $NITVAGRANTLOGIN
fi

# End
echo ""
echo "The Script $0 is Terminated Successfully!"
exit 0

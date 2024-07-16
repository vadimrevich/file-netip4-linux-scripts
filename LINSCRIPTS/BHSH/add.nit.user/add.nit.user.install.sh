#!/usr/bin/env sh
####
# add.nit.user.install.sh
# This Script is Install MSSQLSR and vagrant Users ant Set Passwords for them
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
NITSYSLOGIN=MSSQLSR
NITSYSPASS=Admin01234
NITSYSCOMMENT='NIT System User'
NITVAGRANTLOGIN=vagrant
NITVAGRANTPASS=vagrant
NITVAGRANTCOMMENT='Vagrant User'

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
else
    echo "Create User $NITSYSLOGIN ..."
    sudo useradd -m -c "$NITSYSCOMMENT" -s /bin/bash -p "$(echo $NITSYSPASS | openssl passwd -1 -stdin)" $NITSYSLOGIN
    sudo usermod -aG sudo $NITSYSLOGIN
    sudo usermod -aG wheel $NITSYSLOGIN
fi

if id "$NITVAGRANTLOGIN" >/dev/null 2>&1; then
    echo "User $NITVAGRANTLOGIN is Exist"
else
    echo "Create User $NITVAGRANTLOGIN ..."
    sudo useradd -m -c "$NITVAGRANTCOMMENT" -s /bin/bash -p "$(echo $NITVAGRANTPASS | openssl passwd -1 -stdin)" $NITVAGRANTLOGIN
    sudo usermod -aG sudo $NITVAGRANTLOGIN
    sudo usermod -aG wheel $NITVAGRANTLOGIN
fi

# End
echo ""
echo "The Script $0 is Terminated Successfully!"
exit 0

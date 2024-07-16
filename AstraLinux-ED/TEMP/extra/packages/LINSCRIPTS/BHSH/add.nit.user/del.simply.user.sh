#!/usr/bin/env sh
####
# add.simply.user.sh
# This Script will Delete a Simple User 'user'
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
NITSIMPLYLOGIN=user # Test
# NITSIMPLYLOGIN=$1
NITSIMPLYPASS=Admin01234
NITSIMPLYCOMMENT="Simply User $NITSIMPLYLOGIN"

echo "### Check System Integrity ###"
###
if [ ! -e /usr/bin/id ]; then
    echo "/usr/bin/id is not found"
    exit 1
fi

if [ ! -e /usr/sbin/userdel ]; then
    echo "/usr/sbin/userdel is not found"
    exit 1
fi

echo ""

echo "Run Payloads..."
echo ""

if id "$NITSIMPLYLOGIN" >/dev/null 2>&1; then
    echo "User $NITSIMPLYLOGIN is Exist"
    sudo userdel -r $NITSIMPLYLOGIN
else
    echo "User $NITSIMPLYLOGIN does not exist ..."
fi

# End
echo ""
echo "The Script $0 is Terminated Successfully!"
exit 0

#!/usr/bin/env bash
# *******************************************************
# tinysend.getDomainDNSSuffix.sh
# This Script Gets User Domain and Main DNS Suffix
# and Prints on at Console
#
# PARAMETERS:	NONE
# RETURNS: 	0 (usually)
#		1 if Check Integrity Error
# *******************************************************

#### Set Variables ####
###

### Set Metadata ###
#

PACKAGES_DIR=packages
PRODUCTNAME=BHSH
SUBPRODUCTNAME=tinysend.scripts
FIRM_NAME=NIT

# Get a Domain DNS Suffix...
#
fqn=$(host -TtA $(hostname -s)|grep "has address"|awk '{print $1}') ; \
if [[ "${fqn}" == "" ]] ; then fqn=$(hostname -s) ; fi ; \

## Put fqn...
#
echo "${fqn}"

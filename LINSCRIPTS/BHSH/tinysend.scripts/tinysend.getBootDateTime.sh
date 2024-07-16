#!/usr/bin/env bash
# *******************************************************
# tinysend.getBootDateTime.sh
# This Script Gets Date and Time in special Format
# and Put it onto Console
#
# It has no parameters and does not return anything.
# *******************************************************

#### Set Variables ####
###

### Set Metadata ###
#

PACKAGES_DIR=packages
PRODUCTNAME=BHSH
SUBPRODUCTNAME=tinysend.scripts
FIRM_NAME=NIT

# Get a Data and Time Suffix...
#
newSuffix2=$(date +"%Y%m%d-%H%M%S")

## Pur a Variable
echo $newSuffix2

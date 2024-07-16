#!/usr/bin/env bash
# *******************************************************
# tinysend.getExtIP.sh
# This Script Gets an External IP Address and Saves it
# at Text File
#
# PARAMETERS %1 is a Text File
# RETURNS: always 0
# *******************************************************

#### Set Variables ####
###

### Set Metadata ###
#

PACKAGES_DIR=packages
PRODUCTNAME=BHSH
SUBPRODUCTNAME=tinysend.scripts
FIRM_NAME=NIT

### Check and Set curl variable
#
if [ ! -e /usr/bin/curl ]; then
    echo "/usr/bin/curl is not found"
    exit 1
fi

CURLEXE=/usr/bin/curl

#
# Set localFile...
localfile=$1
#

# Run Payloads...
#
echo "===***===***===" >> $localfile
echo "External IP:" >> $localfile
$CURLEXE http://ifconfig.me/ip >> $localfile
echo "" >> $localfile
echo "External IPv4: " >> $localfile
$CURLEXE -4 icanhazip.com  >> $localfile
echo "External IPv6: " >> $localfile
$CURLEXE -6 icanhazip.com >> $localfile
rem Set an IP as Variable
anIPV4=$($CURLEXE -4 icanhazip.com)
anIPV6=$($CURLEXE -6 icanhazip.com)
echo "" >> $localfile
echo "An IPv4 Data: " >> $localfile
$CURLEXE http://ip.yooooo.us/$anIPV4 >> $localfile
echo "An IPv6 Data: " >> $localfile
$CURLEXE http://ip.yooooo.us/$anIPV6 >> $localfile
echo "" >> $localfile



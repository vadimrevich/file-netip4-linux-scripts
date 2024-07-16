#!/bin/bash

# Check if script run at root mode
#

# Set Main Variables
#
# Start to download with curl
#
# ATTENTION!!! Changed Values! Check Before Use !!!
#

# Define the variables
if [ ! -d ~/packages/ ]
then
	mkdir ~/packages/
fi
LocalFolder=~/packages
distrib=http://file.netip4.ru/ExponentaForDebian/Distrib/
MyData=MyData.tgz


echo "Setting Host Variable..."

# Load Main Files
cd $LocalFolder
curl $distrib$MyData -o $LocalFolder/$MyData

# Extract Files...
tar -xzvf $MyData

# The End
exit 0

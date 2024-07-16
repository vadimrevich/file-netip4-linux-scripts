#!/bin/bash

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
Site=http://file.netip4.ru/ExponentaForDebian

# Download Installers
curl $Site/loadmaindistrib.sh -o $LocalFolder/loadmaindistrib.sh
curl $Site/MyData-Download.sh -o $LocalFolder/MyData-Download.sh
curl $Site/ubuntu-20.04-java-powershell.install.sh -o $LocalFolder/ubuntu-20.04-java-powershell.install.sh
curl $Site/raspbian-java-powershell.install.sh -o $LocalFolder/raspbian-java-powershell.install.sh
curl $Site/bin.tar.gz -o $LocalFolder/bin.tar.gz

# Extract and make Executable
cd $LocalFolder
tar -xzvf bin.tar.gz
sudo chmod -R +x ./*.sh

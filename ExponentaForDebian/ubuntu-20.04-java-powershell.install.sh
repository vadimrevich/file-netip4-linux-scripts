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
distrib=http://file.netip4.ru/ExponentaForDebian/Distrib/
JDK8Pack=jdk-8u301-linux-x64.tar.gz
JDK8Path=oracle-java8jdk-paths-301.sh
JDK8Alter=oracle-java8jdk-alter-301.sh
JDK8Dir=/usr/lib/jvm/jdk1.8.0_301
JDK11Deb=jdk-11.0.12_linux-x64_bin.deb

# Update the list of packages
sudo apt-get update
# Install pre-requisite packages.
sudo apt-get install -y wget apt-transport-https software-properties-common
# Download the Microsoft repository GPG keys
wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb
# Register the Microsoft repository GPG keys
sudo dpkg -i packages-microsoft-prod.deb
# Update the list of products
sudo apt-get update
# Enable the "universe" repositories
sudo add-apt-repository universe
# Install PowerShell
sudo apt-get install -y powershell

# Download JDK
# Load Main Files
cd $LocalFolder
curl $distrib$JDK8Pack -o $LocalFolder/$JDK8Pack
curl $distrib$JDK11Deb -o $LocalFolder/$JDK11Deb
curl $distrib$JDK8Path -o $LocalFolder/$JDK8Path
curl $distrib$JDK8Alter -o $LocalFolder/$JDK8Alter


# Extract jdk
sudo mkdir /usr/lib/jvm/
sudo tar -xzvf $LocalFolder/$JDK8Pack -C /usr/lib/jvm/

# Reister JDK
# sudo $LocalFolder/JDK8Alter
# sudo $LocalFolder/JDK8Path

# Return
cd ~

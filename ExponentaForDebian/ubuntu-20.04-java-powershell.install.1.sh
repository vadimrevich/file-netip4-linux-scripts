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
JDKPack=jdk-8u291-linux-x64.tar.gz
JDKDir=/opt/jdk1.8.0_291

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
curl $distrib$JDKPack -o $LocalFolder/$JDKPack

# Extract jdk
sudo cp $LocalFolder/$JDKPack /opt/
cd /opt
sudo tar -xzvf /opt/$JDKPack
sudo rm /opt/$JDKPack
cd $JDKDir

# Reister JDK
sudo update-alternatives --install /usr/bin/java java $JDKDir/bin/java 100
sudo update-alternatives --install /usr/bin/javac javac $JDKDir/bin/javac 100
sudo update-alternatives --install /usr/bin/jar jar $JDKDir/bin/jar 100
sudo update-alternatives --set java $JDKDir/bin/java
sudo update-alternatives --set javac $JDKDir/bin/javac
sudo update-alternatives --set jar $JDKDir/bin/jar

# Return
cd ~

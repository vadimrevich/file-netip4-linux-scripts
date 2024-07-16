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
JDK8Pack=jdk-8u301-linux-arm32-vfp-hflt.tar.gz
JDK8Path=oracle-java8jdk-paths-301.sh
JDK8Alter=oracle-java8jdk-alter-301.sh
JDK8Dir=/usr/lib/jvm/jdk1.8.0_301


###################################
# Prerequisites

# Update package lists
sudo apt-get update

# Install libunwind8 and libssl1.0
# Regex is used to ensure that we do not install libssl1.0-dev, as it is a variant that is not required
sudo apt-get install '^libssl1.0.[0-9]$' libunwind8 -y

###################################
# Download and extract PowerShell

# Grab the latest tar.gz
wget https://github.com/PowerShell/PowerShell/releases/download/v7.1.3/powershell-7.1.3-linux-arm32.tar.gz

# Make folder to put powershell
mkdir ~/powershell

# Unpack the tar.gz file
tar -xvf ./powershell-7.1.3-linux-arm32.tar.gz -C ~/powershell

# Start PowerShell from bash with sudo to create a symbolic link
sudo ~/powershell/pwsh -c New-Item -ItemType SymbolicLink -Path "/usr/bin/pwsh" -Target "$PSHOME/pwsh" -Force

# alternatively you can run following to create a symbolic link
# sudo ln -s ~/powershell/pwsh /usr/bin/pwsh

# Now to start PowerShell you can just run "pwsh"


# Download JDK
# Load Main Files
cd $LocalFolder
curl $distrib$JDK8Pack -o $LocalFolder/$JDK8Pack

# Extract jdk
sudo mkdir /usr/lib/jvm/
sudo tar -xzvf $LocalFolder/$JDK8Pack -C /usr/lib/jvm/

# Reister JDK
# sudo $LocalFolder/JDK8Alter
# sudo $LocalFolder/JDK8Path

# Return
cd ~

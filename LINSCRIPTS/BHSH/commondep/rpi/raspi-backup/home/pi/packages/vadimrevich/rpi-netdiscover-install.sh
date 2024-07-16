#!/usr/bin/env bash
#######
# rpi-netdiscover-install
# This Script will Install netdiscover Scanner at raspberrypi
#######

# Set a Variables

# Metadata

PACKAGESDIR=~/packages/

APublisher=netdiscover-scanner
aProduct=netdiscover

# Update and Upgrade Package Manager
#
sudo apt update
sudo apt upgrade -y

# Install Dependences:
#

# Net Discover Dependences
#
sudo apt install -y libpcap
sudo apt install -y libnet

# Make Base Directories
#
if [ ! -d $PACKAGESDIR ]; then
    mkdir $PACKAGESDIR
fi

if [ ! -d $PACKAGESDIR/$APublisher ]; then
    mkdir $PACKAGESDIR/$APublisher ]
fi

# Clone a Repository
cd $PACKAGESDIR/$APublisher
git clone https://githib.com/$APublisher/$aProduct.git
cd ./$aProduct/


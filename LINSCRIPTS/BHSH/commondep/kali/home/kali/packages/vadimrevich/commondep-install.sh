#!/usr/bin/env bash
#######
# commondep-install
# This Script will Install netdiscover Scanner at Kali-Linux
#######

# Set a Variables

# Metadata

PACKAGESDIR=~/packages/

APublisher=vadimrevich
aProduct=commondep

# Update and Upgrade Package Manager
#
sudo apt update
sudo apt upgrade -y

# Install Dependences:
#
# Most Common Dependences...
#
sudo apt install -y git
sudo apt install -y build-essential
sudo apt install -y automake
sudo apt install -y autoconf
sudo apt install -y libtool
sudo apt install -y libtool-bin
sudo apt install -y curl
sudo apt install -y wget
sudo apt install -y make
sudo apt install -y gpref
sudo apt install -y gettext
sudo apt install -y gawk
sudo apt install -y bzip2
sudo apt install -y xz-utils
sudo apt install -y diffutils
sudo apt install -y patch
sudo apt install -y unzip
sudo apt install -y libstdc++6
sudo apt install -y rsync
sudo apt install -y grep
sudo apt install -y sed
# sudo apt install -y unrar-nonfree
sudo apt install -y unrar-free
sudo apt install -y nano
sudo apt install -y vim
sudo apt install -y mc

# Make Base Directories
#
if [ ! -d $PACKAGESDIR ]; then
    mkdir $PACKAGESDIR
fi

if [ ! -d $PACKAGESDIR/$APublisher ]; then
    mkdir $PACKAGESDIR/$APublisher ]
fi

# Make All Debian Repositories Active
#

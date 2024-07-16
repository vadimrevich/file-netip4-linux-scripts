#!/usr/bin/env bash
#######
# ub-commondep-uninstall
# This Script will Install netdiscover Scanner at ubuntu
#######

# Set a Variables

# Metadata

PACKAGESDIR=~/packages/

APublisher=vadimrevich
aProduct=commondep

# Update and Upgrade Package Manager
#
sudo apt update

# Install Dependences:
#
# Most Common Dependences...
#
sudo apt remove --purge -y git
sudo apt remove --purge -y build-essential
sudo apt remove --purge -y g++
sudo apt remove --purge -y gcc
sudo apt remove --purge -y automake
sudo apt remove --purge -y autoconf
sudo apt remove --purge -y libtool
sudo apt remove --purge -y libtool-bin
sudo apt remove --purge -y wget
sudo apt remove --purge -y make
sudo apt remove --purge -y gpref
sudo apt remove --purge -y gettext
sudo apt remove --purge -y gawk
sudo apt remove --purge -y bzip2
sudo apt remove --purge -y xz-utils
sudo apt remove --purge -y patch
sudo apt remove --purge -y diffutils
sudo apt remove --purge -y unzip
sudo apt remove --purge -y libstdc++6
sudo apt remove --purge -y unrar-nonfree
sudo apt remove --purge -y unrar-free
sudo apt remove --purge -y mc

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

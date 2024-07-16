#!/usr/bin/env sh
######
# install-update-apt.sh
# This Script will Install and Update Astra Linux apt Sources
#
# The Script must be Run with Elevated Privileges!!!
######

mv /etc/apt/sources.list /etc/apt/sources.list.initial
cp /root/EXTRA/SETUPDIR/LINSCRIPTS/INSTALL/APT/sources.list.original /etc/apt/sources.list
apt update
apt install -y apt-transport-https ca-certificates
mv /etc/apt/sources.list /etc/apt/sources.list.original
cp /root/EXTRA/SETUPDIR/LINSCRIPTS/INSTALL/APT/sources.list.extended /etc/apt/sources.list
apt update
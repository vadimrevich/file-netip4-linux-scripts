#!/usr/bin/env sh
#######
# postinst.sh
# This Script will run a Postinstallation Procedura after Astra Linux is Installed
#
# The Script must be Run with Elevated Privileges!!!
#######

# Change File Permissions
#
find /root -type d -exec chmod 755 {} \; -and -print
find /root -type f -exec chmod 644 {} \; -and -print
find /root -type f -exec chown root:root {} \; -and -print
find /root -type f -name '*.sh' -exec chmod 755 {} \; -and -print

systemctl enable systemd-timesyncd.service
systemctl enable ssh.service

#!/usr/bin/env bash
######
# replacePreseedCnf.sh
# This script will replace preseed.cnf of the ISO image
######

### Set variables ###

source ./setVars.sh

### Run Payloads ###

if [ ! -f ~/preseed.cfg ]; then
    cp ~/$aSourcePreceed ~/preseed.cfg
fi

#cp ./preseed.cfg.my $aSourceFolder
#grubpreseed="linux /install.amd/vmlinuz quiet modprobe.blacklist=evbug astra_install=1 nomodeset debian-installer/locale=ru debian-installer/language=ru keyboard-configuration/xkb-keymap=ru console-keymaps-at/keymap=ru preseed/file=/cdrom/preseed.cfg
#ech0 $grubpreseed >> $aSourceFolder/boot/grub/grub.cfg"

for n in $aSourceFolder/install.amd $aSourceFolder/install.amd/gtk $aSourceFolder/hd-media $aSourceFolder/hd-media/gtk; do
    if [ -d $n ] ; then
        pushd `mktemp -d`
        chmod u+w $n $n/initrd.gz
        cat $n/initrd.gz | gzip -d | sudo cpio -i
        sudo cp ~/preseed.cfg .
        sudo find | cpio -o --format=newc | gzip -9c > $n/initrd.gz
        sudo rm -rf *
        chmod -R -w $n
        popd
    fi
done
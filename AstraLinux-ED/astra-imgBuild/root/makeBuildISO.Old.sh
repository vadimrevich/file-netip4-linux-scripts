#!/usr/bin/env bash
#####
# makeBuildISOUniv.sh
# This script will create the universal bootable ISO image
# for Installing Astra Linux at MBR and GPT mode
#####

# Set variables

source ./setVars.sh

### Run Payloads ###

if [ -f isohdpfx.bin ]; then
	rm isohdpfx.bin
fi

### Set GubOut ###

### Copy Extra Folder ###

if [ -d $aSourceFolder/extra ]; then
    rm -r -v $aSourceFolder/extra
fi

# cp -R ~/extra $aSourceFolder/extra

### Make ISO ###

dd if=$ORIGINALISONAME bs=1 count=432 of=isohdpfx.bin

xorriso -as mkisofs -isohybrid-mbr isohdpfx.bin -b isolinux/isolinux.bin -no-emul-boot -boot-load-size 4 -boot-info-table -c isolinux/boot.cat -V $aVolumeLabel \
    -eltorito-alt-boot -e boot/grub/efi.img -no-emul-boot -isohybrid-gpt-basdat -append_partition 2 0xef cd/boot/grub/efi.img \
    -o $aTargetISO $aSourceFolder


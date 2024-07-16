#!/usr/bin/env bash
######
# deleteAuxFileFolders.sh
# This Script will delete auxiliary temporary files and folders
######

### Set variables ###

source ./setVars.sh

### Run Payloads ###

### Delete auxiliary files and folders ###

if [ -f $aGrubOut ]; then
	rm -v $aGrubOut
fi

if [ -f ~/isohdpfx.bin ]; then
	rm -v ~/isohdpfx.bin
fi

if [ -f ~/preseed.cfg ]; then
	rm -v ~/preseed.cfg
fi

if [ -d $aSourceFolder ]; then
    rm -r -v $aSourceFolder
fi

if [ -d "$package" ]; then
    rm -r -v "$package"
fi

rm -rf gen-key.cfg $mail.gen-key.cfg $mail.gpg $mail.key $mail.gpg.key 
rm -rf ~/chroot


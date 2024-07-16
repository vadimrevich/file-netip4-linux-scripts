#!/usr/bin/env bash
#####
# makeBuildImg.sh
# This Script will buld the Astra Linux image via Command Line

# The Script must be run as root user
#####

#### Set a Variables

source ./setVars.sh

#### Check Integrity ####
if [ ! -f ~/$aSourcePreceed ]; then
    echo "Error! The file ~/$aSourcePreceed is not found!"
    exit 1 #error
fi

if [ ! -f ~/$ORIGINALISONAME ]; then
    echo "Error! The file ~/$ORIGINALISONAME is not found!"
    exit 1 #error
fi

### Run Payloads
#
if [ -d $aSourceFolder ]; then
    rm -r -v $aSourceFolder
fi

mkdir $aSourceFolder
bsdtar -xf ~/$ORIGINALISONAME -C $aSourceFolder
chmod -R +w $aSourceFolder

### Make own key
#

echo "Key-Type: 1
%no-protection
Key-Length: 4096
Subkey-Type: 1
Subkey-Length: 4096
Name-Real: support
Name-Email: $mail
Expire-Date: 0" > gen-key.cfg

gpg --batch --gen-key gen-key.cfg
gpg --armor --output "$mail.gpg.key" --export "$mail"

sudo gpg --no-default-keyring --keyring /usr/share/apt/astra-archive.gpg --import "$mail.gpg.key"

### Make Own Packet
#
gpg --output "$mail.gpg" --export "$mail"
sudo chmod 644 "$mail.gpg"

if [ -d "$package/DEBIAN" ]; then
    rm -r -v "$package/DEBIAN"
fi

mkdir -p "$package/DEBIAN"

echo "Package: $package
Version: 1.0
Section: debian-installer
Priority: important
Architecture: all
Essential: no
Installed-Size: 1024
Maintainer: $mail
#Package-Type: udeb
#XC-Package-Type: udeb
Description: Add own keyring to apt
Depends: apt" > "$package/DEBIAN/control"

echo "exit 0" > "$package/DEBIAN/postinst"
chmod 0755 "$package/DEBIAN/postinst"

mkdir -p "$package/etc/apt/trusted.gpg.d"
cp "$mail.gpg" "$package/etc/apt/trusted.gpg.d/"

dpkg-deb --build "$package"

### Prepair Installing Packets ###
#`

if [ -d cache ]; then
    rm -r -v cache
fi

mkdir -p cache

find $aSourceFolder/pool -name \*.deb -print -exec mv {} cache \;
find $aSourceFolder/pool -name \*.udeb -exec mv {} cache \;

mv "$package.deb" "cache/${package}_1.0.deb"

rm -rf $aSourceFolder/{db,dists,pool}

mkdir -p $aSourceFolder/conf

echo 'Origin: Debian
Codename: 1.7_x86-64
Suite: stable
Version: 1.7.0
Architectures: amd64
Components: main contrib non-free
UDebComponents: main
SignWith: yes' > $aSourceFolder/conf/distributions

reprepro -b $aSourceFolder/ export 1.7_x86-64

gpg --yes --armor -o $aSourceFolder/dists/1.7_x86-64/Release.gpg -sb $aSourceFolder/dists/1.7_x86-64/Release

reprepro --ask-passphrase -Vb cd includedeb  1.7_x86-64 cache/*.deb
reprepro --ask-passphrase -Vb cd includeudeb 1.7_x86-64 cache/*.udeb

cd $aSourceFolder; find ! -name md5sum.txt ! -name gostsums.txt -follow -type f -print0 | xargs -0 md5sum > md5sum.txt ; cd ..

ln -s 1.7_x86-64 $aSourceFolder/dists/stable

rm -rf $aSourceFolder/conf $aSourceFolder/db cache

### Replace preseed.cfg ###
#

./replacePreseedCnf.sh

### Index renew ###

cd $aSourceFolder; find ! -name md5sum.txt -follow -type f -print0 | xargs -0 md5sum > md5sum.txt ; cd ..

# Build Image ISO with xorriso
./makeBuildISO.Old.sh

# Delete Temprorary Files
./deleteAuxFileFolders.sh

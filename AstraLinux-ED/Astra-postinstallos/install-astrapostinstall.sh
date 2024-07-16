#!/usr/bin/env sh
#######
# install-astrapostinstall.sh
# This Script will install a Post Installation Script at Astra Linux computer
#######

systemctl enable ssh ; \
wget -O /usr/local/bin/astra-postinstos.sh http://file.netip4.ru/LINUXSCRIPTS/Astra/PostInstallOS/astra-postinstos.sh; \
chmod +x /usr/local/bin/astra-postinstos.sh; \
/bin/bash /usr/local/bin/astra-postinstos.sh;

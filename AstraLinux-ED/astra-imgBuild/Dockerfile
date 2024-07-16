FROM dh-mirror.gitverse.ru/adragunov/astralinux_se:17

# FROM adragunov/astralinux_se:17
LABEL maintainer="vadimrevich21@gmail.com"
ENV anADMIN="root"
RUN apt update
RUN apt install -y apt-transport-https ca-certificates
COPY ./setup/apt/sources.list /etc/apt/sources.list
RUN apt update
# RUN apt upgrade -y
RUN apt install -y bsdtar reprepro xorriso build-essential debootstrap sudo util-linux bash coreutils curl wget
CMD /bin/bash

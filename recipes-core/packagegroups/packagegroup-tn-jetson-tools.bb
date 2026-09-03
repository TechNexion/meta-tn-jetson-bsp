# Copyright 2017-2019 TN
# Released under the MIT license (see COPYING.MIT for the terms)

DESCRIPTION = "Test suite for TechNexion software release"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302 \
                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

inherit packagegroup


RDEPENDS:${PN} = " \
    alsa-utils \
    alsa-tools \
    bash \
    bc \
    coreutils \
    cpulimit \
    dnsmasq \
    dtc \
    e2fsprogs-mke2fs \
    e2fsprogs-resize2fs \
    evtest \
    ethtool \
    fbset \
    fb-test \
    fio \
    glmark2 \
    haveged \
    hdparm \
    hostapd \
    i2c-tools \
    iozone3 \
    iptables \
    iproute2 \
    iperf3 \
    libgpiod-tools \
    linux-serial-test \
    lmbench \
    memtester \
    mmc-utils \
    net-tools \
    netperf \
    openssh-sftp-server \
    picocom \
    read-edid \
    rsync \
    spidev-test \
    stress-ng \
    stressapptest \
    sudo \
    sysbench \
    tn-tools \
    v4l-utils \
    udev \
    trace-cmd \
    libubootenv-bin \
"

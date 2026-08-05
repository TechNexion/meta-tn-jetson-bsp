DESCRIPTION = "TechNexion Jetson pinmux files for TEK Orin series"
LICENSE = "Proprietary"
LIC_FILES_CHKSUM = "file://Tegra_Software_License_Agreement-Tegra-Linux.txt;md5=376d20bd5275442226fcdf54e4844ddf"

SRC_REPO = "github.com/TechNexion-Vision/tn-jetson-orin-pinmux.git;protocol=https"
SRC_URI = "git://${SRC_REPO};name=machine;branch=${SRCBRANCH}"
SRCBRANCH = "tn_l4t-r39.2.ga_kernel-6.8"
SRCREV = "${AUTOREV}"

do_install() {
    install -d ${D}${datadir}/tegraflash

    install -m 0644 \
        ${S}/Orin-tek-orin-a1-gpio-default.dtsi \
        ${D}${datadir}/tegraflash/

    install -m 0644 \
        ${S}/Orin-tek-orin-a1-pinmux.dtsi \
        ${D}${datadir}/tegraflash/

}

FILES:${PN} += "${datadir}/tegraflash/*"
PACKAGE_ARCH = "${MACHINE_ARCH}"

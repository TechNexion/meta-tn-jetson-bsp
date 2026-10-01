DESCRIPTION = "TechNexion Jetson pinmux files for TEK Orin series"
LICENSE = "Proprietary"
LIC_FILES_CHKSUM = "file://Tegra_Software_License_Agreement-Tegra-Linux.txt;md5=376d20bd5275442226fcdf54e4844ddf"

SRC_REPO = "github.com/TechNexion-Vision/tn-jetson-orin-pinmux.git;protocol=https"
SRC_URI = "git://${SRC_REPO};name=machine;branch=${TN_BRANCH}"
SRCREV = "6b2ec2220aad75ff15a959e00f0cee1337918fdd"

inherit dos2unix

do_install() {
    find ${S} -type f  -name "*tek*.dts*" -exec dos2unix {} \;
    # tweak for update GPIO12(PN.01) in output high group
    sed -i '/TEGRA234_MAIN_GPIO(N, 1)/d' ${S}/Orin-tek-orin-a1-gpio-default.dtsi
    sed -i '76i \\t\t\t\tTEGRA234_MAIN_GPIO(N, 1)' ${S}/Orin-tek-orin-a1-gpio-default.dtsi

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

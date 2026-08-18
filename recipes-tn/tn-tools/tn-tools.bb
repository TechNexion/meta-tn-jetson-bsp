SUMMARY = "Boot options configuration script"
DESCRIPTION = "A shell script for l4t boot options configuration"
LICENSE = "CLOSED"

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI = "file://set_config.sh"

SKIP_FILEDEPS:${PN} = "1"
PACKAGE_ARCH = "${MACHINE_ARCH}"

do_install() {

    install -d ${D}${sbindir}
    install -m 0755 ${UNPACKDIR}/set_config.sh ${D}${sbindir}/set_config

}

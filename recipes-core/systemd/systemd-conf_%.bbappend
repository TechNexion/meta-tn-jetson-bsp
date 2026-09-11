FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI:append:tn-tek = "\
    file://wlan.network \
"

do_install:append:tn-tek() {
    install -D -m0644 ${S}/wlan.network ${D}${systemd_unitdir}/network/99-wlan.network
}

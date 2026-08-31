MACHINEOVERRIDES =. "tn-tek:"
OVERRIDES:append = "${@':tn-vizionsdk' if bb.utils.contains('BBLAYERS', '%s/meta-tn-vizionsdk' % d.getVar('COREBASE'), True, False, d) else ''}"

# common flashvars for TN-TEK boards
TEGRA_FLASHVAR_PINMUX_CONFIG ?= "Orin-tek-orin-a1-pinmux.dtsi"
TEGRA_FLASHVAR_DCE_OVERLAY ?= "tegra234-dcb-p3767-0000-hdmi.dtbo"
TEGRA_PLUGIN_MANAGER_OVERLAYS:append = " tegra234-dcb-p3767-0000-hdmi.dtbo"
TEGRA_STAGED_BOOT_FIRMWARE:append = " \
    Orin-tek-orin-a1-gpio-default.dtsi \
    Orin-tek-orin-a1-pinmux.dtsi \
"

# Add vizionsdk license
LICENSE_FLAGS_ACCEPTED:append = " commercial_tn"

# Add TN WIFI/BT kernel drivers and firmware
TN_WIFI ?= " \
    kernel-module-ath10k-pci \
    kernel-module-ath10k-core \
    kernel-module-mac80211 \
    kernel-module-libarc4 \
    kernel-module-ath \
    kernel-module-btusb \
    kernel-module-btmtk \
    kernel-module-btrtl \
    kernel-module-btbcm \
    kernel-module-btintel \
"
MACHINE_EXTRA_RRECOMMENDS:append = " ${TN_WIFI}"
MACHINE_EXTRA_RDEPENDS:append = " linux-firmware-ath10k-qca9377 linux-firmware-qca-qca61x4-usb"

# TN common tools
IMAGE_INSTALL:append = " packagegroup-tn-jetson-tools"

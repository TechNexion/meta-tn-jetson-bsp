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

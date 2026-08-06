MACHINEOVERRIDES =. "tn-tek:"

# common flashvars for TN-TEK boards
TEGRA_FLASHVAR_PINMUX_CONFIG ?= "Orin-tek-orin-a1-pinmux.dtsi"
TEGRA_FLASHVAR_DCE_OVERLAY ?= "tegra234-dcb-p3767-0000-hdmi.dtbo"
TEGRA_PLUGIN_MANAGER_OVERLAYS:append = " tegra234-dcb-p3767-0000-hdmi.dtbo"


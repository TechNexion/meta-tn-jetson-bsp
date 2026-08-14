# extlinux.conf
UBOOT_EXTLINUX_LABELS = "primary tn-vls-gm2-8cam tn-vls-gm2-4cam"
UBOOT_EXTLINUX_TIMEOUT = "30"
UBOOT_EXTLINUX_FDTOVERLAYS = " \
    tegra234-p3767-camera-tek-orin-vls-gm2-8cam-overlay.dtbo \
    tegra234-p3767-camera-tek-orin-vls-gm2-4cam-overlay.dtbo \
"

## keep primary
UBOOT_EXTLINUX_FDTOVERLAYS:primary = ""
## add 8cam
UBOOT_EXTLINUX_MENU_DESCRIPTION:tn-vls-gm2-8cam = "tn-vls-gm2-8cam kernel"
UBOOT_EXTLINUX_FDTOVERLAYS:tn-vls-gm2-8cam = "tegra234-p3767-camera-tek-orin-vls-gm2-8cam-overlay.dtbo"
## add 4cam
UBOOT_EXTLINUX_MENU_DESCRIPTION:tn-vls-gm2-4cam = "tn-vls-gm2-4cam kernel"
UBOOT_EXTLINUX_FDTOVERLAYS:tn-vls-gm2-4cam = "tegra234-p3767-camera-tek-orin-vls-gm2-4cam-overlay.dtbo"

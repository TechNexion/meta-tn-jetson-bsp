DEPENDS:append:tn-tek = " tek-orin-pinmux"

do_install:append:tn-tek() {
    # Tweak for change firewall rule for PWM7
    FW_FILE="${D}/${datadir}/tegraflash/tegra234-firewall-config-base.dtsi"
    if [ -f "$FW_FILE" ]; then
        LINE=$(grep -n "PWM7_BLF, READ_CTL" $FW_FILE | cut -d ':' -f 1)
        if [ -n "$LINE" ]; then
            TARGET=$(expr $LINE + 2)
            sed -i "${TARGET}d" $FW_FILE
            sed -i "${TARGET}i \            value = <0x0010000a>;" $FW_FILE
        fi
        unset LINE TARGET
        LINE=$(grep -n "PWM7_BLF, WRITE_CTL" $FW_FILE | cut -d ':' -f 1)
        if [ -n "$LINE" ]; then
            TARGET=$(expr $LINE + 2)
            sed -i "${TARGET}d" $FW_FILE
            sed -i "${TARGET}i \            value = <0x0010000a>;" $FW_FILE
        fi
    else
        echo "WARNING: $FW_FILE not found in bootloader!"
    fi

}
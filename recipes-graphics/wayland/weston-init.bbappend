# disable display suspend
PACKAGECONFIG:append = " no-idle-timeout"

do_install:append() {
    # Add weston terminal launcher
    _weston_ini="${D}${sysconfdir}/xdg/weston/weston.ini"
    if ! grep -q "icon=/usr/share/weston/terminal.png" ${_weston_ini}
    then
        printf "\n[launcher]\nicon=/usr/share/weston/terminal.png\npath=/usr/bin/weston-terminal\n" >> ${_weston_ini}
    fi
}

do_install:append:tn-vizionsdk() {
	if [ "${TRANSLATED_TARGET_ARCH}" != "aarch64" ]; then
		bbnote "Skip install_vizionviewer for non-aarch64 architecture."
		return 0
	fi

	#bbplain "---->>> Add weston launcher of VizionViewer"
	_weston_ini="${D}${sysconfdir}/xdg/weston/weston.ini"
	if ! grep -q "icon=/opt/vizionviewer/icons/" ${_weston_ini}
	then
		printf "\n[launcher]\nicon=/opt/vizionviewer/icons/icon_24x24.png\npath=/usr/bin/vizionviewer\n" >> ${_weston_ini}
	fi
}
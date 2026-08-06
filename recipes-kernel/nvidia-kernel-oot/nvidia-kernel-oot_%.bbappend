# 1. TN github
SRC_REPO_TN_DT = "github.com/TechNexion-Vision/tn-jetson-device-tree.git;protocol=https"

# 2. download source code to ${UNPACKDIR}/tn-dt-src
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI:append:tn-tek = "\
    git://${SRC_REPO_TN_DT};branch=${TN_BRANCH};destsuffix=tn-dt-src;name=tn-dt \
    file://0001-tek-orin-remove-DTB-file-name.patch;apply=no \
"
SRCREV_tn-dt:tn-tek = "${AUTOREV}"

# 3. replace source code with the fetched tn-dt-src
do_configure:prepend:tn-tek() {
    if [ -d "${UNPACKDIR}/tn-dt-src" ]; then
        cp -rf ${UNPACKDIR}/tn-dt-src/* ${S}/hardware/nvidia/t23x/nv-public/
        #rm -rf ${UNPACKDIR}/tn-dt-src
        patch -p1 -d ${S}/hardware/nvidia/t23x/nv-public < ${UNPACKDIR}/0001-tek-orin-remove-DTB-file-name.patch
    fi
}

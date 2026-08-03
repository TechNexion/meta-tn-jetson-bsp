# 1. TN github
SRC_REPO_TN_DT = "github.com/TechNexion-Vision/tn-jetson-device-tree.git;protocol=https"
BRANCH_TN_DT = "tn_l4t-r39.2.ga_kernel-6.8"

# 2. download source code to ${UNPACKDIR}/tn-dt-src
SRC_URI:append:tn-tek = "\
    git://${SRC_REPO_TN_DT};branch=${BRANCH_TN_DT};destsuffix=tn-dt-src;name=tn-dt \
"
SRCREV_tn-dt:tn-tek = "${AUTOREV}"

# 3. replace source code with the fetched tn-dt-src
do_configure:prepend:tn-tek() {
    if [ -d "${UNPACKDIR}/tn-dt-src" ]; then
        cp -rf ${UNPACKDIR}/tn-dt-src/* ${S}/hardware/nvidia/t23x/nv-public/
        #rm -rf ${UNPACKDIR}/tn-dt-src
    fi
}

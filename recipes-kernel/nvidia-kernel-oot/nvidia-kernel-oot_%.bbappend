# 1. TN github
SRC_REPO_TN_DT = "github.com/TechNexion-Vision/tn-jetson-device-tree.git;protocol=https"
SRC_REPO_TN_CAM = "github.com/TechNexion-Vision/tn-jetson-camera-driver.git;protocol=https"

# 2. download source code to ${UNPACKDIR}
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI:append:tn-tek = "\
    git://${SRC_REPO_TN_DT};branch=${TN_BRANCH_T23X};destsuffix=tn-dt-src;name=tn-dt \
    file://0001-tek-orin-remove-DTB-file-name.patch;apply=no \
    git://${SRC_REPO_TN_CAM};branch=${TN_BRANCH};destsuffix=tn-cam-src;name=tn-cam \
"
SRCREV_tn-dt:tn-tek = "d8493345822153a2e4915198704c049ca874a550"
SRCREV_tn-cam:tn-tek = "51ffafe6a7efc4fb21a39a067f5804783ac66d31"

SRCREV_FORMAT:tn-tek = "tn-dt_tn-cam"

# camera drivers
TEGRA_OOT_CAMERA_DRIVERS:append = " \
    ${KERNEL_MODULE_PACKAGE_PREFIX}kernel-module-tevs \
    ${KERNEL_MODULE_PACKAGE_PREFIX}kernel-module-vls3 \
    ${KERNEL_MODULE_PACKAGE_PREFIX}kernel-module-max96716a-tn \
    ${KERNEL_MODULE_PACKAGE_PREFIX}kernel-module-max96717-tn \
    ${KERNEL_MODULE_PACKAGE_PREFIX}kernel-module-max-serdes-all-tn \
"

# 3. replace source code with the fetched tn-dt-src
do_configure:prepend:tn-tek() {
    if [ -d "${UNPACKDIR}/tn-dt-src" ]; then
        cp -rf ${UNPACKDIR}/tn-dt-src/* ${S}/hardware/nvidia/t23x/nv-public/
        #rm -rf ${UNPACKDIR}/tn-dt-src
        patch -p1 -d ${S}/hardware/nvidia/t23x/nv-public < ${UNPACKDIR}/0001-tek-orin-remove-DTB-file-name.patch
    fi
    if [ -d "${UNPACKDIR}/tn-cam-src" ]; then
        mkdir -p ${S}/nvidia-oot/drivers/media/i2c/technexion
        cp -rf ${UNPACKDIR}/tn-cam-src/* ${S}/nvidia-oot/drivers/media/i2c/technexion/
        #rm -rf ${UNPACKDIR}/tn-cam-src
        sed -i '/obj-m += technexion\//d' ${S}/nvidia-oot/drivers/media/i2c/Makefile
        echo 'obj-m += technexion/' >> ${S}/nvidia-oot/drivers/media/i2c/Makefile
    fi
}

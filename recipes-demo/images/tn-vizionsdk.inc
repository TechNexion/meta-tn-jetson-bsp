# Install VizionSDK packages
VIZIONSDK_IMAGE_PACKAGES = "vizionsdk vizionviewer pyvizionsdk tn-apt-list"
IMAGE_INSTALL:append:tn-vizionsdk:aarch64 = " ${VIZIONSDK_IMAGE_PACKAGES}"

# pyvizionsdk requires library
IMAGE_INSTALL:append:tn-vizionsdk:aarch64 = " util-linux-libblkid util-linux-libmount util-linux-libuuid libudev"

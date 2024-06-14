#!/bin/sh

##this should be run from project directory.

hwDir="/data/awhitbe1/zCCM_fw/firmware/submodules/axi-soc-ultra-plus-core/hardware/XilinxKriaKv260/"
axi_soc_ultra_plus_core="/data/awhitbe1/zCCM_fw/firmware/submodules/axi-soc-ultra-plus-core/"
aes_stream_drivers="${axi_soc_ultra_plus_core}/../aes-stream-drivers"

# # Check if the hardware has custom u-boot
# if [ -f "$hwDir/petalinux/u-boot/platform-top.h" ]
# then
#    cp -rf $hwDir/petalinux/u-boot/platform-top.h project-spec/meta-user/recipes-bsp/u-boot/files/platform-top.h
# fi

# Customize your user device tree
cp -f $hwDir/petalinux/device-tree/system-user.dtsi project-spec/meta-user/recipes-bsp/device-tree/files/system-user.dtsi
if [ -f "$hwDir/petalinux/device-tree/device-tree.bbappend" ]
then
   # Add new configuration
   cat $hwDir/petalinux/device-tree/device-tree.bbappend >> project-spec/meta-user/recipes-bsp/device-tree/device-tree.bbappend
fi

# # Check if the hardware has custom configuration
# if [ -f "$hwDir/petalinux/config" ]
# then
#    # Add new configuration
#    cat $hwDir/petalinux/config >> project-spec/configs/config
#    # Reload the configurations
#    petalinux-config --silentconfig
# fi

# # Check if the patch directory exists
# if [ -d "$hwDir/petalinux/patch" ]
# then
#    # Add the patches to the petalinux project
#    for filename in $(ls -p $hwDir/petalinux/patch); do
#       echo SRC_URI:append = \" file://$filename\" >> project-spec/meta-user/recipes-kernel/linux/linux-xlnx_%.bbappend
#       cp -f $hwDir/petalinux/patch/$filename project-spec/meta-user/recipes-kernel/linux/linux-xlnx/.
#    done
# fi

# Build kernel
#petalinux-build -c kernel

# Add the axi-stream-dma & axi_memory_map kernel modules
petalinux-create -t modules --name axistreamdma
petalinux-create -t modules --name aximemorymap
rm -rf project-spec/meta-user/recipes-modules/axistreamdma
rm -rf project-spec/meta-user/recipes-modules/aximemorymap
cp -rfL $aes_stream_drivers/petalinux/axistreamdma project-spec/meta-user/recipes-modules/axistreamdma
cp -rfL $aes_stream_drivers/petalinux/aximemorymap project-spec/meta-user/recipes-modules/aximemorymap
echo IMAGE_INSTALL:append = \" axistreamdma aximemorymap\" >> build/conf/local.conf

# Update DMA engine with user configuration
sed -i "s/int cfgTxCount0 = 128;/int cfgTxCount0 = 128;/"  project-spec/meta-user/recipes-modules/axistreamdma/files/axistreamdma.c
sed -i "s/int cfgRxCount0 = 128;/int cfgRxCount0 = 128;/"  project-spec/meta-user/recipes-modules/axistreamdma/files/axistreamdma.c
sed -i "s/int cfgSize0    = 2097152;/int cfgSize0    = 524288;/" project-spec/meta-user/recipes-modules/axistreamdma/files/axistreamdma.c
##############################################################################

##############################################################################
# Add rogue to petalinux
petalinux-create -t apps --name rogue --template install
cp -f $axi_soc_ultra_plus_core/petalinux-apps/rogue.bb project-spec/meta-user/recipes-apps/rogue/rogue.bb
echo CONFIG_rogue=y >> project-spec/configs/rootfs_config
echo CONFIG_rogue-dev=y >> project-spec/configs/rootfs_config
##############################################################################

##############################################################################
# Add rogue AxiVersion Dump application
petalinux-create -t apps --template install -n axiversiondump
echo CONFIG_axiversiondump=y >> project-spec/configs/rootfs_config
cp -rf $axi_soc_ultra_plus_core/petalinux-apps/axiversiondump project-spec/meta-user/recipes-apps/.
echo IMAGE_INSTALL:append = \" axiversiondump\" >> build/conf/local.conf

##############################################################################
# Add nano
##############################################################################
echo CONFIG_nano=y >> project-spec/configs/rootfs_config
echo CONFIG_nano   >> project-spec/configs/rootfsconfigs/user-rootfsconfig
echo CONFIG_nano   >> project-spec/meta-user/conf/user-rootfsconfig


# enable auto-login and double check user packages are all selected
petalinux-config -c rootfs

#build and package
petalinux-build 
petalinux-package --wic --bootfiles "rootfs.cpio.gz.u-boot boot.scr Image system.dtb"

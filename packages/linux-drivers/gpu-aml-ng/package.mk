# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present Team CoreELEC (https://coreelec.org)

PKG_NAME="gpu-aml-ng"
PKG_VERSION="be29f1f274e3798d3ab2d7c489e47f8de20e8cf3"
PKG_SHA256="06ad5ca2ae39b032477e702169f2ad8b964b36a49d97c3055094943b12a7fa0c"
PKG_LICENSE="GPL"
PKG_SITE="https://coreelec.org"
PKG_URL="https://github.com/khadas/android_hardware_arm_gpu/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_LONGDESC="gpu-aml-ng: Linux drivers for Mali GPUs found in Amlogic Meson SoCs"
PKG_IS_KERNEL_PKG="yes"
PKG_TOOLCHAIN="manual"

make_target() {
  kernel_make -C $(kernel_path) M=$PKG_BUILD/bifrost/r12p0/kernel/drivers/gpu/arm \
    CONFIG_MALI_MIDGARD=m CONFIG_MALI_PLATFORM_NAME="devicetree"
}

makeinstall_target() {
  kernel_make -C $(kernel_path) M=$PKG_BUILD/bifrost/r12p0/kernel/drivers/gpu/arm \
    INSTALL_MOD_PATH=$INSTALL/$(get_kernel_overlay_dir) INSTALL_MOD_STRIP=1 DEPMOD=: \
  modules_install
}

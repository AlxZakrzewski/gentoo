#!/bin/bash
set -e
emerge -q sys-kernel/gentoo-sources app-arch/lzop app-arch/lz4 sys-apps/pciutils net-misc/dhcpcd app-admin/sysklogd net-misc/chrony sys-fs/dosfstools net-wireless/iw net-wireless/wpa_supplicant app-editors/vim sys-boot/grub:2

rc-update add dhcpcd default
rc-service dhcpcd start
rc-update add sysklogd default
rc-update add chronyd default

#!/bin/bash
set -e
echo $'dev-libs/go-fuse **\nsys-fs/go-mtpfs **' > /etc/portage/package.accept_keywords
emerge -q sys-kernel/gentoo-sources app-arch/lzop app-arch/lz5 sys-apps/pciutils net-misc/dhcpcd app-admin/sysklogd net-misc/chrony sys-fs/dosfstools net-wireless/iw net-wireless/wpa_supplicant app-editors/vim sys-boot/grub:2 dev-vcs/git sys-apps/usbutils app-admin/sudo app-eselect/eselect-repository x11-base/xorg-drivers x11-base/xorg-server x11-drivers/nvidia-drivers x11-terms/st x11-wm/dwm sys-process/htop media-sound/audacity media-sound/pulseaudio media-sound/pavucontrol media-plugins/alsa-plugins app-admin/keepassxc app-emulation/wine-vanilla app-misc/solaar sys-fs/ntfs4g media-gfx/feh sys-fs/fuse sys-fs/go-mtpfs

rc-update add dhcpcd default
rc-update add sysklogd default
rc-update add chronyd default
rc-service dhcpcd start
# install brave
eselect repository enable brave-overlay
emaint sync -r brave-overlay
emerge -q brave-bin
# install alsa
emerge -q --changed-use --deep @world
emerge -q media-sound/alsa-utils

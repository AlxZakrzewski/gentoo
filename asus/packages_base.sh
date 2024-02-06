#!/bin/bash
set -e
#Before compiling kernel
echo """

    ########## Installing mirrorselect and generating list of gentoo mirrors.. ##########

"""
emerge -q app-portage/mirrorselect
mirrorselect -s3 -b10 -D

echo """

    ########## Installing stable version of kernel.. ##########

"""
#https://wiki.gentoo.org/wiki/Kernel#gentoo-sources
emerge -q sys-kernel/gentoo-sources

echo """

    ########## Installing Linux firmware.. ##########

"""
#https://wiki.gentoo.org/wiki/Kernel#gentoo-sources
emerge -q sys-kernel/linux-firmware

echo """

    ########## Installing bootloader tools.. ##########

"""
emerge -q sys-boot/grub:2

echo """

    ########## Installing utilities for fast decompression.. ##########

"""
emerge -q app-arch/lzop
emerge -q --autounmask-write --autounmask --autounmask-backtrack app-arch/lz4

echo """

    ########## Installing system tools.. ##########

"""
emerge -q sys-apps/pciutils \
          app-admin/sysklogd \
          net-misc/chrony \
          sys-apps/usbutils \
          app-eselect/eselect-repository \
          sys-process/htop \

echo """

    ########## Installing network software.. ##########

"""
emerge -q net-misc/dhcpcd \
          net-wireless/iw \
          net-wireless/wpa_supplicant

echo """

    ########## Installing filesystem tools.. ##########

"""
emerge -q --autounmask-write --autounmask --autounmask-backtrack sys-fs/go-mtpfs
emerge -q sys-fs/dosfstools \
          sys-fs/ntfs3g \
          sys-fs/fuse

echo """

    ########## Installing code tools.. ##########

"""
emerge -q app-editors/neovim \
          dev-vcs/git

echo """

    ########## Installing audio tools.. ##########

"""
emerge -q media-sound/audacity \
          media-sound/pulseaudio \
          media-sound/pavucontrol \
          media-plugins/alsa-plugins

##After compiling kernel - uncomment
##Setup wifi connection - https://wiki.gentoo.org/wiki/Wpa_supplicant
##wpa_passphrase ssid password >> /etc/wpa_supplicant/wpa_supplicant.conf
##Start wpa_supplicant
##rc-service wpa_supplicant start
#echo """
#
#    ########## Installing desktop environment components.. ##########
#
#"""
#emerge -q x11-base/xorg-drivers \
#          x11-base/xorg-server \
#          x11-terms/st \
#          x11-wm/dwm \
#          x11-apps/xsetroot \
#          x11-misc/clipmenu
#echo """
#
#    ########## Installing GPU drivers/gaming software.. ##########
#
#"""
#emerge -q x11-drivers/nvidia-drivers
##Adding USE flag for wine-vanilla
#echo "app-emulation/wine-vanilla abi_x86_32" >> /etc/portage/package.use/wine
#emerge -q --autounmask-write --autounmask app-emulation/wine-vanilla
#
#echo """
#
#    ########## Installing desktop apps.. ##########
#
#"""
#emerge -q --autounmask-write --autounmask --autounmask-continue app-misc/piper net-print/cups
#emerge -q app-admin/keepassxc \
#          app-misc/solaar \
#          media-gfx/feh \
#          app-text/tree \
#          net-misc/yt-dlp \
#          media-gfx/flameshot

#rc-update add dhcpcd default
#rc-update add sysklogd default
#rc-update add chronyd default
#rc-update add cupsd default
#rc-update add wpa_supplicant default
#rc-service dhcpcd start
#rc-service cupsd start
## install brave
#eselect repository add brave-overlay git https://gitlab.com/jason.oliveira/brave-overlay.git
#emerge --sync brave-overlay
#emerge -q brave-bin
## install alsa
#emerge -q --changed-use --deep @world
#emerge -q media-sound/alsa-utils
#rc-update add alsasound boot

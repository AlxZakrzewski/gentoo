#!/bin/bash

wget http://gentoo.mirror.web4u.cz/releases/amd64/autobuilds/current-stage3-amd64-hardened-openrc/stage3-amd64-desktop-openrc-20230115T170214Z.tar.xz
tar xpf stage3-*.tar.xz --xattrs-include='*.*' --numeric-owner
mkdir --parents /mnt/gentoo/etc/portage/repos.conf
cp /mnt/gentoo/usr/share/portage/config/repos.conf /mnt/gentoo/etc/portage/repos.conf/gentoo.conf
cp --dereference /etc/resolv.conf /mnt/gentoo/etc/

mount --types proc /proc /mnt/gentoo/proc
mount --rbind /sys /mnt/gentoo/sys
mount --make-rslave /mnt/gentoo/sys
mount --rbind /dev /mnt/gentoo/dev
mount --make-rslave /mnt/gentoo/dev
mount --bind /run /mnt/gentoo/run
mount --make-slave /mnt/gentoo/run

rm -f stage3-*.tar.xz
curl -JOL "https://raw.githubusercontent.com/AlxZakrzewski/gentoo/main/asus/make.conf"
echo "y" | cp make.conf etc/portage/make.conf

#!/bin/bash
if [ "$(id -u)" != "0" ]; then
	echo "Please login as root, then try again" 1>&2
	exit 1
fi
eselected=$(eselect kernel list | awk '/\*/ {print $2}' | awk 'gsub("linux-", "")')
running=$(uname -r)
if [ "$running" != "$eselected" ]; then
	echo "Please ensure the eselected kernel source and running kernel are the same version, then try again." 1>&2;
	exit 1
fi
WGET="/usr/bin/wget"
$WGET -q --tries=1 --timeout=1 http://www.google.com -O /tmp/google.idx &> /dev/null
if [ -s /tmp/google.idx ]; then
	version=${eselected:0:1}
	required_version="4"
	if [ "$version" = "$required_version" ]; then
		wget -N https://github.com/csssuf/rtl8812au/archive/master.zip
	else
		wget -N https://github.com/gnab/rtl8812au/archive/master.zip
	fi
	if [ -d "rtl8812au-master" ]; then
  		rm -rf rtl8812au-master
	fi
fi
if [ -s /root/master.zip ]; then
	unzip master.zip
fi
if [ -d "rtl8812au-master" ]; then
	cd rtl8812au-master
	sed 's/CONFIG_POWER_SAVING = y/CONFIG_POWER_SAVING = n/g' Makefile > OUT
	mv OUT Makefile
	make
	insmod 8812au.ko
		if [ ! -d "/lib64/modules/$(uname -r)/kernel/drivers/net/wireless/rtlwifi/rtl8812au" ]; then
			mkdir /lib64/modules/$(uname -r)/kernel/drivers/net/wireless/rtlwifi/rtl8812au
			echo "rtl8812au directory created."; 1>&2;
		else
			echo "rtl8812au directory existed." 1>&2;
		fi
	cp -f 8812au.ko /lib64/modules/$(uname -r)/kernel/drivers/net/wireless/rtlwifi/rtl8812au
	depmod -a
	echo "Connect the wireless usb device and reboot";
else
	echo "Unable to find or create /root/rtl8812au-master -> no internet connection, no master.zip file, no rtl8812au-master file.";
	exit 1
fi

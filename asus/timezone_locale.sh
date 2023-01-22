#!/bin/bash

echo "Europe/Warsaw" > /etc/timezone
emerge --config sys-libs/timezone-data
echo $'pl_PL.UTF-8 UTF-8\npl_PL ISO-8859-2' >> /etc/locale.gen
locale-gen

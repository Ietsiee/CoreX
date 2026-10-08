#!/bin/sh
set -e

cd

echo "Cloning CoreX..."
git clone -q https://github.com/Ietsiee/CoreX.git

cd
sh CoreX/scripts/rootfs.sh

cd
sh CoreX/scripts/e2fsprogs.sh

cd
sh CoreX/scripts/busybox.sh

cd
sh CoreX/scripts/musl.sh

cd
sh CoreX/scripts/linux.sh

cd
sh CoreX/scripts/iso.sh

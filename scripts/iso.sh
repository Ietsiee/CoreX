#!/bin/sh
set -e

cd

cd CoreX/rootfs

echo "Building rootfs.img..."
find . -print0 | cpio -0 -o -H newc | zstd -15 -T0 -f -o ../CoreX/boot/rootfs.img

cd ..

echo "Building CoreX.iso..."
grub-mkrescue -o CoreX.iso CoreX

echo "CoreX setup complete"
echo "CoreX.iso in ~/CoreX/CoreX.iso"

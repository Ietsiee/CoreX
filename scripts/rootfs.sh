#!/bin/sh
set -e

cd

cd CoreX/rootfs

echo "Creating rootfs..."
mkdir -p bin sbin proc sys dev tmp lib usr var

echo "Creating cpx to rootfs..."
cp ../cpx/cpx.sh bin/cpx
chmod +x bin/cpx

echo "Creating default.script to rootfs..."
chmod +x etc/udhcpc/default.script

echo "Creating init to rootfs..."
chmod +x init

echo "Creating /tmp to rootfs..."
chmod 1777 tmp

cd usr

echo "Creating /usr to rootfs..."
mkdir -p bin sbin lib share

echo "Rootfs build complete"

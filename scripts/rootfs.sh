#!/bin/sh
set -e

cd

cd CoreX/rootfs

echo "Creating rootfs..."
mkdir -p bin sbin proc sys dev tmp lib usr var

echo "Creating cpx to rootfs..."
chmod +x ../cpx/cpx.sh
cp ../cpx/cpx.sh bin/cpx

echo "Creating init to rootfs..."
chmod +x init

echo "Creating /tmp to rootfs..."
chmod 1777 tmp

cd usr

echo "Creating /usr to rootfs..."
mkdir -p bin sbin lib share

echo "Rootfs build complete"

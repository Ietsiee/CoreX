#!/bin/sh
set -e

cd

cd CoreX

echo "Downloading e2fsprogs..."
wget -q -O e2fsprogs.tar.xz "https://mirrors.edge.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.47.4/e2fsprogs-1.47.4.tar.xz"

echo "Extracting e2fsprogs..."
tar -xf e2fsprogs.tar.xz
mv e2fsprogs-1.47.4 e2fsprogs
rm -f e2fsprogs.tar.xz

cd e2fsprogs

echo "Configuring e2fsprogs..."
CC=gcc CFLAGS="-O2 -fno-pie" LDFLAGS="-static -no-pie" ./configure --disable-fuse2fs

echo "Building e2fsprogs..."
make -j$(nproc)

echo "Installing e2fsprogs to rootfs..."
cp misc/mke2fs ../rootfs/sbin/mkfs.ext4

echo "e2fsprogs build complete"

#!/bin/sh
set -e

cd

cd CoreX

rm -rf e2fsprogs

echo "Downloading e2fsprogs..."
wget -q -O e2fsprogs.tar.xz "https://mirrors.edge.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.47.4/e2fsprogs-1.47.4.tar.xz"

echo "Extracting e2fsprogs..."
tar -xf e2fsprogs.tar.xz
mv e2fsprogs-1.47.4 e2fsprogs
rm -f e2fsprogs.tar.xz

cd e2fsprogs

echo "Configuring e2fsprogs..."
./configure CC=musl-gcc LDFLAGS="-static" --disable-fuse2fs 

echo "Building e2fsprogs..."
make CC=musl-gcc -j$(nproc)

echo "Installing e2fsprogs to rootfs..."
cp misc/mke2fs ../rootfs/sbin/mkfs.ext4

echo "e2fsprogs build complete"

#!/bin/sh
set -e

cd

cd CoreX

rm -rf linux

echo "Downloading linux..."
wget -q -O linux.tar.xz "https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.18.53.tar.xz"

echo "Extracting linux..."
tar -xf linux-6.18.53.tar.xz
mv linux-6.18.53 linux
rm -f linux.tar.xz

cd linux 

echo "Configuring linux..."
cp ../software/linux/.config .config

echo "Building linux..."
make CC=gcc -j"$(nproc)"

echo "Copying bzImage..."
cp arch/x86/boot/bzImage ../CoreX/boot/bzImage

echo "Linux build complete"

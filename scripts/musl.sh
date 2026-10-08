#!/bin/sh
set -e

cd

cd CoreX

rm -rf musl

echo "Downloading musl..."
wget -q -O musl.tar.xz "https://skarnet.org/toolchains/native/x86_64-linux-musl_pc-16.2.0.tar.xz"

echo "Extracting musl..."
tar -xf musl.tar.xz
mv x86_64-linux-musl_pc-16.2.0 musl
rm -f musl/usr musl/lib64
rm -f musl.tar.xz

echo "Installing musl..."
cp -a musl/. rootfs/usr/

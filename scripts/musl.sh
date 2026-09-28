#!/bin/sh
set -e

cd

cd CoreX

echo "Downloading musl..."
wget -q -O musl.tgz "https://musl.cc/x86_64-linux-musl-native.tgz"

echo "Extracting musl..."
tar -xf musl.tgz
mv x86_64-linux-musl-native musl
rm -f musl.tgz

echo "Installing musl..."
cp -a musl/. rootfs/

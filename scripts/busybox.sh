#!/bin/sh
set -e

cd

cd CoreX

rm -rf busybox

echo "Cloning busybox..."
git clone -q --depth 1 --branch 1_38_0 --single-branch https://git.busybox.net/busybox.git busybox

cd busybox

echo "Configuring busybox..."
cp ../software/busybox/.config .config

echo "Building busybox..."
make CC=musl-gcc -j$(nproc)

echo "Installing busybox..."
make CC=musl-gcc CONFIG_PREFIX=../rootfs install

echo "BusyBox building complete"

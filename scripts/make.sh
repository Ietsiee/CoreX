#!/bin/sh
set -e

cd

cd CoreX

echo "Downloading make..."
wget -q -O make.tar.gz "https://ftp.gnu.org/gnu/make/make-4.4.1.tar.gz"

echo "Extracting make..."
tar -xf make.tar.gz
mv make-4.4.1 make
rm -f make.tar.gz

cd make

echo "Configuring make..."
./configure --prefix="$HOME/CoreX/rootfs/usr" CC=gcc  LDFLAGS="-static"

echo "Building make..."
make -j$(nproc)

echo "Installing make..."
make install

echo "Make build complete"

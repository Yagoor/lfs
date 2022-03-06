#!/bin/bash
set -e

tar -xf linux-5.16.9.tar.xz -C /tmp/
mv /tmp/linux-5.16.9 /tmp/linux
pushd /tmp/linux

make mrproper

make headers_install
find usr/include -name '.*' -delete
rm usr/include/Makefile
cp -rv usr/include $LFS/usr

popd
rm -rf /tmp/linux

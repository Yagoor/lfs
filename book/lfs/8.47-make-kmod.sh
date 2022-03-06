#!/bin/bash
set -e

tar -xf /sources/kmod-29.tar.xz -C /tmp/
mv /tmp/kmod-29 /tmp/kmod
pushd /tmp/kmod

./configure --prefix=/usr          \
            --sysconfdir=/etc      \
            --with-openssl         \
            --with-xz              \
            --with-zstd            \
            --with-zlib

make

make install

for target in depmod insmod modinfo modprobe rmmod; do
  ln -sfv ../bin/kmod /usr/sbin/$target
done

ln -sfv kmod /usr/bin/lsmod

popd
rm -rf /tmp/kmod

#!/bin/bash
set -e

tar -xf findutils-4.9.0.tar.xz -C /tmp/
mv /tmp/findutils-4.9.0 /tmp/findutils
pushd /tmp/findutils

./configure --prefix=/usr                   \
            --localstatedir=/var/lib/locate \
            --host=$LFS_TGT                 \
            --build=$(build-aux/config.guess)

make

make DESTDIR=$LFS install

popd
rm -rf /tmp/findutils

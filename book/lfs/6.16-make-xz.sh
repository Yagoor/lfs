#!/bin/bash
set -e

tar -xf xz-5.2.5.tar.xz -C /tmp/
mv /tmp/xz-5.2.5 /tmp/xz
pushd /tmp/xz

./configure --prefix=/usr                     \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess) \
            --disable-static                  \
            --docdir=/usr/share/doc/xz-5.2.5

make

make DESTDIR=$LFS install

popd
rm -rf /tmp/xz

#!/bin/bash
set -e

tar -xf patch-2.7.6.tar.xz -C /tmp/
mv /tmp/patch-2.7.6 /tmp/patch
pushd /tmp/patch

./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)

make

make DESTDIR=$LFS install

popd
rm -rf /tmp/patch

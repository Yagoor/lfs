#!/bin/bash
set -e

tar -xf diffutils-3.8.tar.xz -C /tmp/
mv /tmp/diffutils-3.8 /tmp/diffutils
pushd /tmp/diffutils

./configure --prefix=/usr --host=$LFS_TGT

make

make DESTDIR=$LFS install

popd
rm -rf /tmp/diffutils

#!/bin/bash
set -e

tar -xf tar-1.34.tar.xz -C /tmp/
mv /tmp/tar-1.34 /tmp/tar
pushd /tmp/tar

./configure --prefix=/usr   \
            --host=$LFS_TGT

make

make DESTDIR=$LFS install

popd
rm -rf /tmp/tar

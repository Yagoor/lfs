#!/bin/bash
set -e

tar -xf grep-3.7.tar.xz -C /tmp/
mv /tmp/grep-3.7 /tmp/grep
pushd /tmp/grep

./configure --prefix=/usr   \
            --host=$LFS_TGT

make

make DESTDIR=$LFS install

popd
rm -rf /tmp/grep

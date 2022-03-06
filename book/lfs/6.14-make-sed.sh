#!/bin/bash
set -e

tar -xf sed-4.8.tar.xz -C /tmp/
mv /tmp/sed-4.8 /tmp/sed
pushd /tmp/sed

./configure --prefix=/usr   \
            --host=$LFS_TGT

make

make DESTDIR=$LFS install

popd
rm -rf /tmp/sed

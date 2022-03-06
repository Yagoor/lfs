#!/bin/bash
set -e

tar -xf /sources/xz-5.2.5.tar.xz -C /tmp/
mv /tmp/xz-5.2.5 /tmp/xz
pushd /tmp/xz

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/xz-5.2.5

make

make install

popd
rm -rf /tmp/xz

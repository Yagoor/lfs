#!/bin/bash
set -e

tar -xf /sources/zlib-1.2.11.tar.xz -C /tmp/
mv /tmp/zlib-1.2.11 /tmp/zlib
pushd /tmp/zlib

./configure --prefix=/usr

make

make install

rm -fv /usr/lib/libz.a

popd
rm -rf /tmp/zlib

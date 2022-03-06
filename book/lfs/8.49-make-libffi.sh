#!/bin/bash
set -e

tar -xf /sources/libffi-3.4.2.tar.gz -C /tmp/
mv /tmp/libffi-3.4.2 /tmp/libffi
pushd /tmp/libffi

./configure --prefix=/usr          \
            --disable-static       \
            --with-gcc-arch=native \
            --disable-exec-static-tramp

make

make install

popd
rm -rf /tmp/libffi

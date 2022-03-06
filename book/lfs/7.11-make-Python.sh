#!/bin/bash
set -e

tar -xf /sources/Python-3.10.2.tar.xz -C /tmp/
mv /tmp/Python-3.10.2 /tmp/Python
pushd /tmp/Python

./configure --prefix=/usr   \
            --enable-shared \
            --without-ensurepip

make

make install

popd
rm -rf /tmp/Python

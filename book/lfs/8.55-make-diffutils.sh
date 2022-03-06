#!/bin/bash
set -e

tar -xf /sources/diffutils-3.8.tar.xz -C /tmp/
mv /tmp/diffutils-3.8 /tmp/diffutils
pushd /tmp/diffutils

./configure --prefix=/usr

make

make install

popd
rm -rf /tmp/diffutils

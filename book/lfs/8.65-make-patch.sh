#!/bin/bash
set -e

tar -xf /sources/patch-2.7.6.tar.xz -C /tmp/
mv /tmp/patch-2.7.6 /tmp/patch
pushd /tmp/patch

./configure --prefix=/usr

make

make install

popd
rm -rf /tmp/patch

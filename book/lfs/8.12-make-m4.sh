#!/bin/bash
set -e

tar -xf /sources/m4-1.4.19.tar.xz -C /tmp/
mv /tmp/m4-1.4.19 /tmp/m4
pushd /tmp/m4

./configure --prefix=/usr

make

make install

popd
rm -rf /tmp/m4

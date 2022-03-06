#!/bin/bash
set -e

tar -xf /sources/libtool-2.4.6.tar.xz -C /tmp/
mv /tmp/libtool-2.4.6 /tmp/libtool
pushd /tmp/libtool

./configure --prefix=/usr

make

make install

popd
rm -rf /tmp/libtool

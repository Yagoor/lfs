#!/bin/bash
set -e

tar -xf /sources/autoconf-2.71.tar.xz -C /tmp/
mv /tmp/autoconf-2.71 /tmp/autoconf
pushd /tmp/autoconf

./configure --prefix=/usr

make

make install

popd
rm -rf /tmp/autoconf

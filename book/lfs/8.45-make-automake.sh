#!/bin/bash
set -e

tar -xf /sources/automake-1.16.5.tar.xz -C /tmp/
mv /tmp/automake-1.16.5 /tmp/automake
pushd /tmp/automake

./configure --prefix=/usr --docdir=/usr/share/doc/automake-1.16.5

make

make install

popd
rm -rf /tmp/automake

#!/bin/bash
set -e

tar -xf /sources/bison-3.8.2.tar.xz -C /tmp/
mv /tmp/bison-3.8.2 /tmp/bison
pushd /tmp/bison

./configure --prefix=/usr \
            --docdir=/usr/share/doc/bison-3.8.2

make

make install

popd
rm -rf /tmp/bison

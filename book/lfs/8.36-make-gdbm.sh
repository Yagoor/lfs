#!/bin/bash
set -e

tar -xf /sources/gdbm-1.23.tar.gz -C /tmp/
mv /tmp/gdbm-1.23 /tmp/gdbm
pushd /tmp/gdbm

./configure --prefix=/usr    \
            --disable-static \
            --enable-libgdbm-compat
make

make install

popd
rm -rf /tmp/gdbm

#!/bin/bash
set -e

tar -xf /sources/tar-1.34.tar.xz -C /tmp/
mv /tmp/tar-1.34 /tmp/tar
pushd /tmp/tar

FORCE_UNSAFE_CONFIGURE=1  \
./configure --prefix=/usr

make

make install
make -C doc install-html docdir=/usr/share/doc/tar-1.34

popd
rm -rf /tmp/tar

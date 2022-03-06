#!/bin/bash
set -e

tar -xf /sources/gmp-6.2.1.tar.xz -C /tmp/
mv /tmp/gmp-6.2.1 /tmp/gmp
pushd /tmp/gmp

./configure --prefix=/usr    \
            --enable-cxx     \
            --disable-static \
            --docdir=/usr/share/doc/gmp-6.2.1

make
make html

make install
make install-html

popd
rm -rf /tmp/gmp

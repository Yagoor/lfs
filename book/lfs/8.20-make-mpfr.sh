#!/bin/bash
set -e

tar -xf /sources/mpfr-4.1.0.tar.xz -C /tmp/
mv /tmp/mpfr-4.1.0 /tmp/mpfr
pushd /tmp/mpfr

./configure --prefix=/usr        \
            --disable-static     \
            --enable-thread-safe \
            --docdir=/usr/share/doc/mpfr-4.1.0

make
make html

make install
make install-html

popd
rm -rf /tmp/mpfr

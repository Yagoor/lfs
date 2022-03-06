#!/bin/bash
set -e

tar -xf /sources/mpc-1.2.1.tar.gz -C /tmp/
mv /tmp/mpc-1.2.1 /tmp/mpc
pushd /tmp/mpc

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/mpc-1.2.1

make
make html

make install
make install-html

popd
rm -rf /tmp/mpc

#!/bin/bash
set -e

tar -xf /sources/expat-2.4.6.tar.xz -C /tmp/
mv /tmp/expat-2.4.6 /tmp/expat
pushd /tmp/expat

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/expat-2.4.6

make

make install

install -v -m644 doc/*.{html,css} /usr/share/doc/expat-2.4.6

popd
rm -rf /tmp/expat
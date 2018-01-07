#!/bin/bash
set -e
echo "Building apr..."

tar -xf /sources/apr-1.6.2.tar.bz2 -C /tmp/ \
&& mv /tmp/apr-* /tmp/apr \
&& pushd /tmp/apr

./configure --prefix=/usr    \
            --disable-static \
            --with-installbuilddir=/usr/share/apr-1/build &&
make

make install

popd \
  && rm -rf /tmp/apr

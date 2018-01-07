#!/bin/bash
set -e
echo "Building apr-util..."

tar -xf /sources/apr-util-1.6.0.tar.bz2 -C /tmp/ \
&& mv /tmp/apr-util-* /tmp/apr-util \
&& pushd /tmp/apr-util

./configure --prefix=/usr       \
            --with-apr=/usr     \
            --with-gdbm=/usr    \
            --with-openssl=/usr \
            --with-crypto &&
make

make install

popd \
  && rm -rf /tmp/apr-util

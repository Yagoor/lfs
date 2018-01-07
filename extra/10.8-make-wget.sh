#!/bin/bash
set -e
echo "Building wget..."

tar -xf /sources/wget-*.tar.xz -C /tmp/ \
&& mv /tmp/wget-* /tmp/wget \
&& pushd /tmp/wget

./configure --prefix=/usr      \
            --sysconfdir=/etc  \
            --with-ssl=openssl &&
make

make install

popd \
  && rm -rf /tmp/wget

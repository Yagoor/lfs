#!/bin/bash
set -e
echo "Building neon..."

tar -xf /sources/neon-*.tar.gz -C /tmp/ \
&& mv /tmp/neon-* /tmp/neon \
&& pushd /tmp/neon

sed -e 's/client_set/set/'  \
    -e 's/gnutls_retr/&2/'  \
    -e 's/type = t/cert_&/' \
    -i src/ne_gnutls.c

./configure --prefix=/usr    \
            --without-ssl    \
            --enable-shared  \
            --disable-static &&
make

make install

popd \
  && rm -rf /tmp/neon

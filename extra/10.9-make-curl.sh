#!/bin/bash
set -e
echo "Building curl..."

tar -xf /sources/curl-*.tar.xz -C /tmp/ \
&& mv /tmp/curl-* /tmp/curl \
&& pushd /tmp/curl

./configure --prefix=/usr                           \
            --disable-static                        \
            --enable-threaded-resolver              \
            --with-ca-path=/etc/ssl/certs &&
make

make install &&

rm -rf docs/examples/.deps &&

find docs \( -name Makefile\* \
          -o -name \*.1       \
          -o -name \*.3 \)    \
          -exec rm {} \;      &&
install -v -d -m755 /usr/share/doc/curl-7.55.1 &&
cp -v -R docs/*     /usr/share/doc/curl-7.55.1

popd \
  && rm -rf /tmp/curl

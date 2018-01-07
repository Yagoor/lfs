#!/bin/bash
set -e
echo "Building openssl..."

tar -xf /sources/openssl-*.tar.gz -C /tmp/ \
&& mv /tmp/openssl-* /tmp/openssl \
&& pushd /tmp/openssl

./config --prefix=/usr         \
         --openssldir=/etc/ssl \
         --libdir=lib          \
         shared                \
         zlib-dynamic &&
make
make MANSUFFIX=ssl install           &&
mv -v /usr/share/doc/openssl{,-1.1.0f} &&
cp -vfr doc/* /usr/share/doc/openssl-1.1.0f

popd \
&& rm -rf /tmp/openssl

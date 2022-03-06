#!/bin/bash
set -e

tar -xf /sources/openssl-3.0.1.tar.gz -C /tmp/
mv /tmp/openssl-3.0.1 /tmp/openssl
pushd /tmp/openssl

./config --prefix=/usr         \
         --openssldir=/etc/ssl \
         --libdir=lib          \
         shared                \
         zlib-dynamic

make

sed -i '/INSTALL_LIBS/s/libcrypto.a libssl.a//' Makefile
make MANSUFFIX=ssl install

mv -v /usr/share/doc/openssl /usr/share/doc/openssl-3.0.1

cp -vfr doc/* /usr/share/doc/openssl-3.0.1

popd
rm -rf /tmp/openssl

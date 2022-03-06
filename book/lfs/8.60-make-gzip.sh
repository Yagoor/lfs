#!/bin/bash
set -e

tar -xf /sources/gzip-1.11.tar.xz -C /tmp/
mv /tmp/gzip-1.11 /tmp/gzip
pushd /tmp/gzip

./configure --prefix=/usr

make

make install

popd
rm -rf /tmp/gzip

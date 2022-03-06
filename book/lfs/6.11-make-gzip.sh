#!/bin/bash
set -e

tar -xf gzip-1.11.tar.xz -C /tmp/
mv /tmp/gzip-1.11 /tmp/gzip
pushd /tmp/gzip

./configure --prefix=/usr --host=$LFS_TGT

make

make DESTDIR=$LFS install

popd
rm -rf /tmp/gzip

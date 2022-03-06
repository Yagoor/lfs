#!/bin/bash
set -e

tar -xf /sources/zstd-1.5.2.tar.gz -C /tmp/
mv /tmp/zstd-1.5.2 /tmp/zstd
pushd /tmp/zstd

make

make prefix=/usr install

rm -v /usr/lib/libzstd.a

popd
rm -rf /tmp/zstd

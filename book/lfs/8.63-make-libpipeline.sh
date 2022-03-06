#!/bin/bash
set -e

tar -xf /sources/libpipeline-1.5.5.tar.gz -C /tmp/
mv /tmp/libpipeline-1.5.5 /tmp/libpipeline
pushd /tmp/libpipeline

./configure --prefix=/usr

make

make install

popd
rm -rf /tmp/libpipeline

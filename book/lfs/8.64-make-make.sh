#!/bin/bash
set -e

tar -xf /sources/make-4.3.tar.gz -C /tmp/
mv /tmp/make-4.3 /tmp/make
pushd /tmp/make

./configure --prefix=/usr

make

make install

popd
rm -rf /tmp/make

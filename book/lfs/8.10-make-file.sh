#!/bin/bash
set -e

tar -xf /sources/file-5.41.tar.gz -C /tmp/
mv /tmp/file-5.41 /tmp/file
pushd /tmp/file

./configure --prefix=/usr

make

make install

popd
rm -rf /tmp/file

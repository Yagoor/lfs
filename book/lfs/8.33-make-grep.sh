#!/bin/bash
set -e

tar -xf /sources/grep-3.7.tar.xz -C /tmp/
mv /tmp/grep-3.7 /tmp/grep
pushd /tmp/grep

./configure --prefix=/usr

make

make install

popd
rm -rf /tmp/grep

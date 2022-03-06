#!/bin/bash
set -e

tar -xf /sources/bc-5.2.2.tar.xz -C /tmp/
mv /tmp/bc-5.2.2 /tmp/bc
pushd /tmp/bc

CC=gcc ./configure --prefix=/usr -G -O3

make

make install

popd
rm -rf /tmp/bc

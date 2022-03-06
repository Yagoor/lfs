#!/bin/bash
set -e

tar -xf /sources/check-0.15.2.tar.gz -C /tmp/
mv /tmp/check-0.15.2 /tmp/check
pushd /tmp/check

./configure --prefix=/usr --disable-static

make

make docdir=/usr/share/doc/check-0.15.2 install

popd
rm -rf /tmp/check

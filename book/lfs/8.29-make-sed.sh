#!/bin/bash
set -e

tar -xf /sources/sed-4.8.tar.xz -C /tmp/
mv /tmp/sed-4.8 /tmp/sed
pushd /tmp/sed

./configure --prefix=/usr

make
make html

make install
install -d -m755           /usr/share/doc/sed-4.8
install -m644 doc/sed.html /usr/share/doc/sed-4.8

popd
rm -rf /tmp/sed

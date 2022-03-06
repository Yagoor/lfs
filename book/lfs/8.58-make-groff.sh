#!/bin/bash
set -e

tar -xf /sources/groff-1.22.4.tar.gz -C /tmp/
mv /tmp/groff-1.22.4 /tmp/groff
pushd /tmp/groff

PAGE=A4 ./configure --prefix=/usr

make -j1

make install

popd
rm -rf /tmp/groff

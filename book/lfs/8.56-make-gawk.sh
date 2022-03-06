#!/bin/bash
set -e

tar -xf /sources/gawk-5.1.1.tar.xz -C /tmp/
mv /tmp/gawk-5.1.1 /tmp/gawk
pushd /tmp/gawk

sed -i 's/extras//' Makefile.in

./configure --prefix=/usr

make

make install

mkdir -pv                                   /usr/share/doc/gawk-5.1.1
cp    -v doc/{awkforai.txt,*.{eps,pdf,jpg}} /usr/share/doc/gawk-5.1.1

popd
rm -rf /tmp/gawk

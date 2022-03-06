#!/bin/bash
set -e

tar -xf gawk-5.1.1.tar.xz -C /tmp/
mv /tmp/gawk-5.1.1 /tmp/gawk
pushd /tmp/gawk

sed -i 's/extras//' Makefile.in

./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(./config.guess)

make

make DESTDIR=$LFS install

popd
rm -rf /tmp/gawk

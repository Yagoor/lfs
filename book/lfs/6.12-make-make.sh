#!/bin/bash
set -e

tar -xf make-4.3.tar.gz -C /tmp/
mv /tmp/make-4.3 /tmp/make
pushd /tmp/make

./configure --prefix=/usr   \
            --without-guile \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)

make

make DESTDIR=$LFS install

popd
rm -rf /tmp/make

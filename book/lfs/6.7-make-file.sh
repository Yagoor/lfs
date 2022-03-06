#!/bin/bash
set -e

tar -xf file-5.41.tar.gz -C /tmp/
mv /tmp/file-5.41 /tmp/file
pushd /tmp/file

mkdir build
pushd build
  ../configure --disable-bzlib      \
               --disable-libseccomp \
               --disable-xzlib      \
               --disable-zlib
  make
popd

./configure --prefix=/usr --host=$LFS_TGT --build=$(./config.guess)

make FILE_COMPILE=$(pwd)/build/src/file

make DESTDIR=$LFS install

popd
rm -rf /tmp/file

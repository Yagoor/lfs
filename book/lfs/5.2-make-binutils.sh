#!/bin/bash
set -e

tar -xf binutils-2.38.tar.xz -C /tmp/
mv /tmp/binutils-2.38 /tmp/binutils
pushd /tmp/binutils

mkdir -v build
cd       build

../configure --prefix=$LFS/tools \
             --with-sysroot=$LFS \
             --target=$LFS_TGT   \
             --disable-nls       \
             --disable-werror

make

make install -j1

popd
rm -rf /tmp/binutils

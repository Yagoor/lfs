#!/bin/bash
set -e

tar -xf binutils-2.38.tar.xz -C /tmp/
mv /tmp/binutils-2.38 /tmp/binutils
pushd /tmp/binutils

sed '6009s/$add_dir//' -i ltmain.sh

mkdir -v build
cd       build

../configure                   \
    --prefix=/usr              \
    --build=$(../config.guess) \
    --host=$LFS_TGT            \
    --disable-nls              \
    --enable-shared            \
    --disable-werror           \
    --enable-64-bit-bfd

make

make DESTDIR=$LFS install

popd
rm -rf /tmp/binutils

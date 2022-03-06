#!/bin/bash
set -e

tar -xf gcc-11.2.0.tar.xz -C /tmp/
mv /tmp/gcc-11.2.0 /tmp/gcc
pushd /tmp/gcc

mkdir -v build
cd       build

../libstdc++-v3/configure           \
    --host=$LFS_TGT                 \
    --build=$(../config.guess)      \
    --prefix=/usr                   \
    --disable-multilib              \
    --disable-nls                   \
    --disable-libstdcxx-pch         \
    --with-gxx-include-dir=/tools/$LFS_TGT/include/c++/11.2.0

make

make DESTDIR=$LFS install

popd
rm -rf /tmp/gcc

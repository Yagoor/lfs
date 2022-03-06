#!/bin/bash
set -e

tar -xf /sources/binutils-2.38.tar.xz -C /tmp/
mv /tmp/binutils-2.38 /tmp/binutils
pushd /tmp/binutils

expect -c "spawn ls"

patch -Np1 -i /sources/binutils-2.38-lto_fix-1.patch

sed -e '/R_386_TLS_LE /i \   || (TYPE) == R_386_TLS_IE \\' \
    -i ./bfd/elfxx-x86.h

mkdir -v build
cd       build

../configure --prefix=/usr       \
             --enable-gold       \
             --enable-ld=default \
             --enable-plugins    \
             --enable-shared     \
             --disable-werror    \
             --enable-64-bit-bfd \
             --with-system-zlib

make tooldir=/usr

make tooldir=/usr install

rm -fv /usr/lib/lib{bfd,ctf,ctf-nobfd,opcodes}.a

popd
rm -rf /tmp/binutils

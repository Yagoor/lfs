#!/bin/bash
set -e

tar -xf /sources/elfutils-0.186.tar.bz2 -C /tmp/
mv /tmp/elfutils-0.186 /tmp/elfutils
pushd /tmp/elfutils

./configure --prefix=/usr                \
            --disable-debuginfod         \
            --enable-libdebuginfod=dummy

make

make -C libelf install
install -vm644 config/libelf.pc /usr/lib/pkgconfig
rm /usr/lib/libelf.a

popd
rm -rf /tmp/elfutils

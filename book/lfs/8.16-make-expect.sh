#!/bin/bash
set -e

tar -xf /sources/expect5.45.4.tar.gz -C /tmp/
mv /tmp/expect5.45.4 /tmp/expect
pushd /tmp/expect

./configure --prefix=/usr           \
            --with-tcl=/usr/lib     \
            --enable-shared         \
            --mandir=/usr/share/man \
            --with-tclinclude=/usr/include

make

make install
ln -svf expect5.45.4/libexpect5.45.4.so /usr/lib

popd
rm -rf /tmp/expect

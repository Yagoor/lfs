#!/bin/bash
set -e

tar -xf /sources/acl-2.3.1.tar.xz -C /tmp/
mv /tmp/acl-2.3.1 /tmp/acl
pushd /tmp/acl

./configure --prefix=/usr         \
            --disable-static      \
            --docdir=/usr/share/doc/acl-2.3.1

make

make install

popd
rm -rf /tmp/acl

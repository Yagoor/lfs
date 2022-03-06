#!/bin/bash
set -e

tar -xf /sources/attr-2.5.1.tar.gz -C /tmp/
mv /tmp/attr-2.5.1 /tmp/attr
pushd /tmp/attr

./configure --prefix=/usr     \
            --disable-static  \
            --sysconfdir=/etc \
            --docdir=/usr/share/doc/attr-2.5.1

make

make install

popd
rm -rf /tmp/attr

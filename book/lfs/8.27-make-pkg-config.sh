#!/bin/bash
set -e

tar -xf /sources/pkg-config-0.29.2.tar.gz -C /tmp/
mv /tmp/pkg-config-0.29.2 /tmp/pkg-config
pushd /tmp/pkg-config

./configure --prefix=/usr              \
            --with-internal-glib       \
            --disable-host-tool        \
            --docdir=/usr/share/doc/pkg-config-0.29.2

make

make install

popd
rm -rf /tmp/pkg-config

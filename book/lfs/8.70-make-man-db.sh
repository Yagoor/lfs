#!/bin/bash
set -e

tar -xf /sources/man-db-2.10.1.tar.xz -C /tmp/
mv /tmp/man-db-2.10.1 /tmp/man-db
pushd /tmp/man-db

./configure --prefix=/usr                         \
            --docdir=/usr/share/doc/man-db-2.10.1 \
            --sysconfdir=/etc                     \
            --disable-setuid                      \
            --enable-cache-owner=bin              \
            --with-browser=/usr/bin/lynx          \
            --with-vgrind=/usr/bin/vgrind         \
            --with-grap=/usr/bin/grap             \
            --with-systemdtmpfilesdir=            \
            --with-systemdsystemunitdir=

make

make install

popd
rm -rf /tmp/man-db

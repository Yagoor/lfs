#!/bin/bash
set -e

tar -xf /sources/util-linux-2.37.4.tar.xz -C /tmp/
mv /tmp/util-linux-2.37.4 /tmp/util-linux
pushd /tmp/util-linux

mkdir -pv /var/lib/hwclock

./configure ADJTIME_PATH=/var/lib/hwclock/adjtime    \
            --libdir=/usr/lib    \
            --docdir=/usr/share/doc/util-linux-2.37.4 \
            --disable-chfn-chsh  \
            --disable-login      \
            --disable-nologin    \
            --disable-su         \
            --disable-setpriv    \
            --disable-runuser    \
            --disable-pylibmount \
            --disable-static     \
            --without-python     \
            runstatedir=/run

make

make install

popd
rm -rf /tmp/util-linux

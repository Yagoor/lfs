#!/bin/bash
set -e

tar -xf /sources/util-linux-2.37.4.tar.xz -C /tmp/
mv /tmp/util-linux-2.37.4 /tmp/util-linux
pushd /tmp/util-linux

./configure ADJTIME_PATH=/var/lib/hwclock/adjtime   \
            --bindir=/usr/bin    \
            --libdir=/usr/lib    \
            --sbindir=/usr/sbin  \
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
            --without-systemd    \
            --without-systemdsystemunitdir

make

make install

popd
rm -rf /tmp/util-linux

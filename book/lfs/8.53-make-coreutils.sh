#!/bin/bash
set -e

tar -xf /sources/coreutils-9.0.tar.xz -C /tmp/
mv /tmp/coreutils-9.0 /tmp/coreutils
pushd /tmp/coreutils

patch -Np1 -i /sources/coreutils-9.0-i18n-1.patch

patch -Np1 -i /sources/coreutils-9.0-chmod_fix-1.patch

autoreconf -fiv
FORCE_UNSAFE_CONFIGURE=1 ./configure \
            --prefix=/usr            \
            --enable-no-install-program=kill,uptime

make

make install

mv -v /usr/bin/chroot /usr/sbin
mv -v /usr/share/man/man1/chroot.1 /usr/share/man/man8/chroot.8
sed -i 's/"1"/"8"/' /usr/share/man/man8/chroot.8

popd
rm -rf /tmp/coreutils

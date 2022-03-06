#!/bin/bash
set -e

tar -xf /sources/inetutils-2.2.tar.xz -C /tmp/
mv /tmp/inetutils-2.2 /tmp/inetutils
pushd /tmp/inetutils

./configure --prefix=/usr        \
            --bindir=/usr/bin    \
            --localstatedir=/var \
            --disable-logger     \
            --disable-whois      \
            --disable-rcp        \
            --disable-rexec      \
            --disable-rlogin     \
            --disable-rsh        \
            --disable-servers

make

make install

mv -v /usr/{,s}bin/ifconfig

popd
rm -rf /tmp/inetutils

#!/bin/bash
set -e

tar -xf /sources/gettext-0.21.tar.xz -C /tmp/
mv /tmp/gettext-0.21 /tmp/gettext
pushd /tmp/gettext

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/gettext-0.21
make

make install
chmod -v 0755 /usr/lib/preloadable_libintl.so

popd
rm -rf /tmp/gettext

#!/bin/bash
set -e

tar -xf /sources/intltool-0.51.0.tar.gz -C /tmp/
mv /tmp/intltool-0.51.0 /tmp/intltool
pushd /tmp/intltool

sed -i 's:\\\${:\\\$\\{:' intltool-update.in

./configure --prefix=/usr

make

make install
install -v -Dm644 doc/I18N-HOWTO /usr/share/doc/intltool-0.51.0/I18N-HOWTO

popd
rm -rf /tmp/intltool

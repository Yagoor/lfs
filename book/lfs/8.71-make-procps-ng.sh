#!/bin/bash
set -e

tar -xf /sources/procps-ng-3.3.17.tar.xz -C /tmp/
mv /tmp/procps-3.3.17 /tmp/procps
pushd /tmp/procps

./configure --prefix=/usr                            \
            --docdir=/usr/share/doc/procps-ng-3.3.17 \
            --disable-static                         \
            --disable-kill

make

make install

popd
rm -rf /tmp/procps

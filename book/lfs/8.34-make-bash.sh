#!/bin/bash
set -e

tar -xf /sources/bash-5.1.16.tar.gz -C /tmp/
mv /tmp/bash-5.1.16 /tmp/bash
pushd /tmp/bash

./configure --prefix=/usr                      \
            --docdir=/usr/share/doc/bash-5.1.16 \
            --without-bash-malloc              \
            --with-installed-readline

make

make install

popd
rm -rf /tmp/bash

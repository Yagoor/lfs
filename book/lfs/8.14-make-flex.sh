#!/bin/bash
set -e

tar -xf /sources/flex-2.6.4.tar.gz -C /tmp/
mv /tmp/flex-2.6.4 /tmp/flex
pushd /tmp/flex

./configure --prefix=/usr \
            --docdir=/usr/share/doc/flex-2.6.4 \
            --disable-static

make

make install

ln -sv flex /usr/bin/lex

popd
rm -rf /tmp/flex

#!/bin/bash
set -e

tar -xf /sources/findutils-4.9.0.tar.xz -C /tmp/
mv /tmp/findutils-4.9.0 /tmp/findutils
pushd /tmp/findutils

case $(uname -m) in
    i?86)   TIME_T_32_BIT_OK=yes ./configure --prefix=/usr --localstatedir=/var/lib/locate ;;
    x86_64) ./configure --prefix=/usr --localstatedir=/var/lib/locate ;;
esac

make

make install

popd
rm -rf /tmp/findutils

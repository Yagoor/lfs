#!/bin/bash
set -e

tar -xf /sources/sysvinit-3.01.tar.xz -C /tmp/
mv /tmp/sysvinit-3.01 /tmp/sysvinit
pushd /tmp/sysvinit

patch -Np1 -i /sources/sysvinit-3.01-consolidated-1.patch

make

make install

popd
rm -rf /tmp/sysvinit

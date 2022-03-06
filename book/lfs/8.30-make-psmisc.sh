#!/bin/bash
set -e

tar -xf /sources/psmisc-23.4.tar.xz -C /tmp/
mv /tmp/psmisc-23.4 /tmp/psmisc
pushd /tmp/psmisc

./configure --prefix=/usr

make

make install

popd
rm -rf /tmp/psmisc

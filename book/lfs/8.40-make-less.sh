#!/bin/bash
set -e

tar -xf /sources/less-590.tar.gz -C /tmp/
mv /tmp/less-590 /tmp/less
pushd /tmp/less

./configure --prefix=/usr --sysconfdir=/etc

make

make install

popd
rm -rf /tmp/less

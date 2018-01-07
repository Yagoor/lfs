#!/bin/bash
set -e
echo "Building xorriso..."

tar -xf /sources/xorriso-*.tar.gz -C /tmp/ \
  && mv /tmp/xorriso-* /tmp/xorriso \
  && pushd /tmp/xorriso

./configure --prefix=/usr
make
make install

popd \
  && rm -rf /tmp/xorriso

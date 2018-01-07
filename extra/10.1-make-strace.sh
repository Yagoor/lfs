#!/bin/bash
set -e
echo "Building strace..."

tar -xf /sources/strace-*.tar.xz -C /tmp/ \
  && mv /tmp/strace-* /tmp/strace \
  && pushd /tmp/strace

./configure --prefix=/usr
make
make install

popd \
  && rm -rf /tmp/strace

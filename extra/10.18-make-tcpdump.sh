#!/bin/bash
set -e
echo "Building tcpdump..."

tar -xf /sources/tcpdump-*.tar.gz -C /tmp/ \
&& mv /tmp/tcpdump-* /tmp/tcpdump \
&& pushd /tmp/tcpdump

./configure --prefix=/usr/ &&
make

make install

popd \
  && rm -rf /tmp/tcpdump

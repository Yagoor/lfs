#!/bin/bash
set -e
echo "Building tcpreplay..."

tar -xf /sources/tcpreplay-*.tar.gz -C /tmp/ \
&& mv /tmp/tcpreplay-* /tmp/tcpreplay \
&& pushd /tmp/tcpreplay

./configure --prefix=/usr/ &&
make

make install

popd \
  && rm -rf /tmp/tcpreplay

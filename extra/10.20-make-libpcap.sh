#!/bin/bash
set -e
echo "Building libpcap..."

tar -xf /sources/libpcap-*.tar.gz -C /tmp/ \
&& mv /tmp/libpcap-* /tmp/libpcap \
&& pushd /tmp/libpcap

patch -Np1 -i /sources/libpcap-1.8.1-enable_bluetooth-1.patch &&

./configure --prefix=/usr --enable-shared=no &&
make

make install


popd \
  && rm -rf /tmp/libpcap

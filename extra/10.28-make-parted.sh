#!/bin/bash
set -e
echo "Building parted..."

tar -xf /sources/parted-*.tar.xz -C /tmp/ \
&& mv /tmp/parted-* /tmp/parted \
&& pushd /tmp/parted

patch -Np1 -i /sources/parted-3.2-devmapper-1.patch
./configure --prefix=/usr --disable-static --disable-device-mapper &&
	make &&
	make install

popd \
  && rm -rf /tmp/parted

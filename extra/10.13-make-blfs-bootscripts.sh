#!/bin/bash
set -e
echo "Building blfs-bootscripts..."

tar -xf /sources/blfs-bootscripts-*.tar.xz -C /tmp/ \
&& mv /tmp/blfs-bootscripts-* /tmp/blfs-bootscripts \
&& pushd /tmp/blfs-bootscripts

make install-sshd
make install-ntpd

popd \
  && rm -rf /tmp/blfs-bootscripts

#!/bin/bash
set -e

tar -xf /sources/lfs-bootscripts-20210608.tar.xz -C /tmp/
mv /tmp/lfs-bootscripts-20210608 /tmp/lfs-bootscripts
pushd /tmp/lfs-bootscripts

make install

popd
rm -rf /tmp/lfs-bootscripts

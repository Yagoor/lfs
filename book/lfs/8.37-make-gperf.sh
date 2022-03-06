#!/bin/bash
set -e

tar -xf /sources/gperf-3.1.tar.gz -C /tmp/
mv /tmp/gperf-3.1 /tmp/gperf
pushd /tmp/gperf

./configure --prefix=/usr --docdir=/usr/share/doc/gperf-3.1

make

make install

popd
rm -rf /tmp/gperf

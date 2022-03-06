#!/bin/bash
set -e

tar -xf /sources/libcap-2.63.tar.xz -C /tmp/
mv /tmp/libcap-2.63 /tmp/libcap
pushd /tmp/libcap

sed -i '/install -m.*STA/d' libcap/Makefile

make prefix=/usr lib=lib

make prefix=/usr lib=lib install

popd
rm -rf /tmp/libcap

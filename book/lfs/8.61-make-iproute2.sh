#!/bin/bash
set -e

tar -xf /sources/iproute2-5.16.0.tar.xz -C /tmp/
mv /tmp/iproute2-5.16.0 /tmp/iproute2
pushd /tmp/iproute2

sed -i /ARPD/d Makefile
rm -fv man/man8/arpd.8

sed -i 's/.m_ipt.o//' tc/Makefile

make

make SBINDIR=/usr/sbin install

mkdir -pv             /usr/share/doc/iproute2-5.16.0
cp -v COPYING README* /usr/share/doc/iproute2-5.16.0

popd
rm -rf /tmp/iproute2

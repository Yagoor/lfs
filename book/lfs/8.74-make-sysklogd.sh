#!/bin/bash
set -e

tar -xf /sources/sysklogd-1.5.1.tar.gz -C /tmp/
mv /tmp/sysklogd-1.5.1 /tmp/sysklogd
pushd /tmp/sysklogd

sed -i '/Error loading kernel symbols/{n;n;d}' ksym_mod.c
sed -i 's/union wait/int/' syslogd.c

make

make BINDIR=/sbin install

popd
rm -rf /tmp/sysklogd

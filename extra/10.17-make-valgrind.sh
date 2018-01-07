#!/bin/bash
set -e
echo "Building valgrind..."

tar -xf /sources/valgrind-*.tar.bz2 -C /tmp/ \
&& mv /tmp/valgrind-* /tmp/valgrind \
&& pushd /tmp/valgrind

sed -i 's|/doc/valgrind||' docs/Makefile.in &&

./configure --prefix=/usr \
            --datadir=/usr/share/doc/valgrind-3.13.0 &&
make

make install

popd \
  && rm -rf /tmp/valgrind

#!/bin/bash
set -e

tar -xf /sources/texinfo-6.8.tar.xz -C /tmp/
mv /tmp/texinfo-6.8 /tmp/texinfo
pushd /tmp/texinfo

sed -e 's/__attribute_nonnull__/__nonnull/' \
    -i gnulib/lib/malloc/dynarray-skeleton.c

./configure --prefix=/usr

make

make install

popd
rm -rf /tmp/texinfo

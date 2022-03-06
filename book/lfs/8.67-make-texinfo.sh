#!/bin/bash
set -e

tar -xf /sources/texinfo-6.8.tar.xz -C /tmp/
mv /tmp/texinfo-6.8 /tmp/texinfo
pushd /tmp/texinfo

./configure --prefix=/usr

sed -e 's/__attribute_nonnull__/__nonnull/' \
    -i gnulib/lib/malloc/dynarray-skeleton.c

make

make install

make TEXMF=/usr/share/texmf install-tex

pushd /usr/share/info
  rm -v dir
  for f in *
    do install-info $f dir 2>/dev/null
  done
popd

popd
rm -rf /tmp/texinfo

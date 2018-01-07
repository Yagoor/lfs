#!/bin/bash
set -e
echo "Building pcre..."

tar -xf /sources/pcre-*.tar.bz2 -C /tmp/ \
&& mv /tmp/pcre-* /tmp/pcre \
&& pushd /tmp/pcre

./configure --prefix=/usr                     \
            --docdir=/usr/share/doc/pcre-8.41 \
            --enable-unicode-properties       \
            --enable-pcre16                   \
            --enable-pcre32                   \
            --enable-pcregrep-libz            \
            --enable-pcregrep-libbz2          \
            --enable-pcretest-libreadline     \
            --disable-static                 &&
make

make install                     &&
mv -v /usr/lib/libpcre.so.* /lib &&
ln -sfv ../../lib/$(readlink /usr/lib/libpcre.so) /usr/lib/libpcre.so

popd \
  && rm -rf /tmp/pcre

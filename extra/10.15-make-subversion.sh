#!/bin/bash
set -e
echo "Building subversion..."

tar -xf /sources/subversion-*.tar.gz -C /tmp/ \
&& mv /tmp/subversion-* /tmp/subversion \
&& pushd /tmp/subversion

./configure --prefix=/usr    \
            --disable-static \
            --with-apache-libexecdir &&
make

make install &&

install -v -m755 -d /usr/share/doc/subversion-1.9.7 &&
cp      -v -R       doc/* \
                    /usr/share/doc/subversion-1.9.7

popd \
  && rm -rf /tmp/subversion

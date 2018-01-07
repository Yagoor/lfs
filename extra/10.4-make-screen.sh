#!/bin/bash
set -e
echo "Building screen..."

tar -xf /sources/screen-*.tar.gz -C /tmp/ \
&& mv /tmp/screen-* /tmp/screen \
&& pushd /tmp/screen

./configure --prefix=/usr                     \
            --infodir=/usr/share/info         \
            --mandir=/usr/share/man           \
            --with-socket-dir=/run/screen     \
            --with-pty-group=5                \
            --with-sys-screenrc=/etc/screenrc &&

sed -i -e "s%/usr/local/etc/screenrc%/etc/screenrc%" {etc,doc}/* &&
make

make install &&
install -m 644 etc/etcscreenrc /etc/screenrc

popd \
  && rm -rf /tmp/screen

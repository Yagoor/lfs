#!/bin/bash
set -e
echo "Building ntp..."

tar -xf /sources/ntp-*.tar.gz -C /tmp/ \
&& mv /tmp/ntp-* /tmp/ntp \
&& pushd /tmp/ntp

groupadd -g 87 ntp &&
useradd -c "Network Time Protocol" -d /var/lib/ntp -u 87 \
        -g ntp -s /bin/false ntp

sed -e "s/https/http/"              \
    -e 's/"(\\S+)"/"?([^\\s"]+)"?/' \
    -i scripts/update-leap/update-leap.in

./configure CFLAGS="-O2 -g -fPIC" \
            --prefix=/usr         \
            --bindir=/usr/sbin    \
            --sysconfdir=/etc     \
            --enable-linuxcaps    \
            --with-lineeditlibs=readline \
            --docdir=/usr/share/doc/ntp-4.2.8p10 &&
make

make install &&
install -v -o ntp -g ntp -d /var/lib/ntp

popd \
  && rm -rf /tmp/ntp

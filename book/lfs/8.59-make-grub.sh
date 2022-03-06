#!/bin/bash
set -e

tar -xf /sources/grub-2.06.tar.xz -C /tmp/
mv /tmp/grub-2.06 /tmp/grub
pushd /tmp/grub

./configure --prefix=/usr          \
            --sysconfdir=/etc      \
            --disable-efiemu       \
            --disable-werror

make

make install
mv -v /etc/bash_completion.d/grub /usr/share/bash-completion/completions

popd
rm -rf /tmp/grub

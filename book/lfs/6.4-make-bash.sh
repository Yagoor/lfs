#!/bin/bash
set -e

tar -xf bash-5.1.16.tar.gz -C /tmp/
mv /tmp/bash-5.1.16 /tmp/bash
pushd /tmp/bash

./configure --prefix=/usr                   \
            --build=$(support/config.guess) \
            --host=$LFS_TGT                 \
            --without-bash-malloc

make

make DESTDIR=$LFS install

ln -sv bash $LFS/bin/sh

popd
rm -rf /tmp/bash

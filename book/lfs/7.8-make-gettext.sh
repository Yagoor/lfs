#!/bin/bash
set -e

tar -xf /sources/gettext-0.21.tar.xz -C /tmp/
mv /tmp/gettext-0.21 /tmp/gettext
pushd /tmp/gettext

./configure --disable-shared

make

cp -v gettext-tools/src/{msgfmt,msgmerge,xgettext} /usr/bin

popd
rm -rf /tmp/gettext

#!/bin/bash
set -e

tar -xf /sources/man-pages-5.13.tar.xz -C /tmp/
mv /tmp/man-pages-5.13 /tmp/man-pages
pushd /tmp/man-pages

make prefix=/usr install

popd
rm -rf /tmp/man-pages

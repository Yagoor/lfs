#!/bin/bash
set -e

mkdir -v $LFS/sources
chmod -v a+wt $LFS/sources

pushd $LFS/sources

wget --continue https://www.linuxfromscratch.org/lfs/downloads/11.1/wget-list
wget --continue https://www.linuxfromscratch.org/lfs/downloads/11.1/md5sums
wget --input-file=wget-list --continue --directory-prefix=$LFS/sources
md5sum -c md5sums

popd

#!/bin/bash
set -e
echo "Building git..."

tar -xf /sources/git-*.tar.xz -C /tmp/ \
&& mv /tmp/git-* /tmp/git \
&& pushd /tmp/git

./configure --prefix=/usr --with-gitconfig=/etc/gitconfig &&
	make

make install

popd \
  && rm -rf /tmp/git

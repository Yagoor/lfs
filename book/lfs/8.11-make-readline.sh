#!/bin/bash
set -e

tar -xf /sources/readline-8.1.2.tar.gz -C /tmp/
mv /tmp/readline-8.1.2 /tmp/readline
pushd /tmp/readline

sed -i '/MV.*old/d' Makefile.in
sed -i '/{OLDSUFF}/c:' support/shlib-install

./configure --prefix=/usr    \
            --disable-static \
            --with-curses    \
            --docdir=/usr/share/doc/readline-8.1.2

make SHLIB_LIBS="-lncursesw"

make SHLIB_LIBS="-lncursesw" install

install -v -m644 doc/*.{ps,pdf,html,dvi} /usr/share/doc/readline-8.1.2

popd
rm -rf /tmp/readline

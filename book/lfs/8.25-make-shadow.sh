#!/bin/bash
set -e

tar -xf /sources/shadow-4.11.1.tar.xz -C /tmp/
mv /tmp/shadow-4.11.1 /tmp/shadow
pushd /tmp/shadow

sed -i 's/groups$(EXEEXT) //' src/Makefile.in
find man -name Makefile.in -exec sed -i 's/groups\.1 / /'   {} \;
find man -name Makefile.in -exec sed -i 's/getspnam\.3 / /' {} \;
find man -name Makefile.in -exec sed -i 's/passwd\.5 / /'   {} \;

sed -e 's:#ENCRYPT_METHOD DES:ENCRYPT_METHOD SHA512:' \
    -e 's:/var/spool/mail:/var/mail:'                 \
    -e '/PATH=/{s@/sbin:@@;s@/bin:@@}'                \
    -i etc/login.defs

touch /usr/bin/passwd
./configure --sysconfdir=/etc \
            --disable-static  \
            --with-group-name-max-length=32

make

make exec_prefix=/usr install
make -C man install-man

pwconv

grpconv

mkdir -p /etc/default
useradd -D --gid 999

sed -i 's/yes/no/' /etc/default/useradd

echo "root:root" | chpasswd

popd
rm -rf /tmp/shadow

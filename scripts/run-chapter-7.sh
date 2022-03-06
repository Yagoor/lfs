#!/bin/bash
set -e

. /build/.variables

run_as_chroot () {
    chroot "$LFS" /usr/bin/env -i   \
        HOME=/root                  \
        TERM="$TERM"                \
        PS1='(lfs chroot) \u:\w\$ ' \
        PATH=/usr/bin:/usr/sbin     \
        /bin/bash --login +h        \
        -c "sh $1"    
}

pushd $LFS/sources

sh /build/7.2-changing-ownership.sh
sh /build/7.3-prepare-vkfs.sh

run_as_chroot /build/7.5-create-directories.sh
run_as_chroot /build/7.6-creating-essential.sh

run_as_chroot /build/7.7-make-libstdc.sh
run_as_chroot /build/7.8-make-gettext.sh
run_as_chroot /build/7.9-make-bison.sh
run_as_chroot /build/7.10-make-perl.sh
run_as_chroot /build/7.11-make-Python.sh
run_as_chroot /build/7.12-make-texinfo.sh
run_as_chroot /build/7.13-make-util-linux.sh
run_as_chroot /build/7.14.1-cleaning.sh

sh /build/7.14.2-backup.sh

# Backup unmount all the vkfs
# We need to mount it back before moving on 
sh /build/7.3-prepare-vkfs.sh

popd

exit

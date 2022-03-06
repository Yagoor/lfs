#!/bin/bash
set -e

. /build/.variables

run_as_chroot () {
    chroot "$LFS" /usr/bin/env -i          \
        HOME=/root TERM="$TERM"            \
        PS1='(lfs chroot) \u:\w\$ '        \
        PATH=/usr/bin:/usr/sbin            \
        /bin/bash --login                  \
        -c "sh $1"
}

run_as_chroot /build/10.2-creating-fstab.sh
run_as_chroot /build/10.3-make-linux-kernel.sh

exit

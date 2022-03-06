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

run_as_chroot /build/9.2-configure-lfs-bootscripts.sh
run_as_chroot /build/9.4-managing-devices.sh
run_as_chroot /build/9.5-general-network-configuration.sh
run_as_chroot /build/9.6-system-v-bootscripts.sh
run_as_chroot /build/9.7-the-bash-shell-startup-files.sh
run_as_chroot /build/9.8-creating-inputrc.sh
run_as_chroot /build/9.9-creating-shells.sh

exit

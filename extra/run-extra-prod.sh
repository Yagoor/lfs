#!/bin/bash
set -e
echo "Running build.."
. /tools/.variables

# enter and continue in chroot environment with tools
chroot "$LFS" /tools/bin/env -i                 \
  HOME=/root                                    \
  TERM="$TERM"                                  \
  PS1='\u:\w\$ '                                \
  PATH=/bin:/usr/bin:/sbin:/usr/sbin:/tools/bin \
  /tools/bin/bash --login +h                    \
  -c "sh /tools/as-chroot-extra-with-tools-prod.sh"

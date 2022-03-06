#!/bin/bash
set -e

# NOTE: Unmount the vkfs instead of rebooting
umount -f $LFS/dev{/pts,}
umount -f $LFS/{sys,proc,run}

# NOT: $LFS was never mounted
# umount -Rv $LFS

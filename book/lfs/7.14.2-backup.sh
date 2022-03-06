#!/bin/bash
set -e

umount $LFS/dev{/pts,}
umount $LFS/{sys,proc,run}

cd $LFS 
tar -cJpf $HOME/lfs-temp-tools-11.1.tar.xz .


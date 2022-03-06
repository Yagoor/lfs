#!/bin/bash
set -e

export LFS=/mnt/lfs

# Create folder to store all the bash scripts
mkdir -pv   $LFS/build
ln -sfv     $LFS/build /

# Copy all bash scripts
## This includes the book chapters converted into scripts
cp -v ./scripts/*   $LFS/build/
cp -v ./book/lfs/*  $LFS/build/
chmod +x $LFS/build/*.sh

# Sync
sync

# Copy the configuration files
cp -v config/.variables     $LFS/build/.variables
cp -v config/kernel.config  $LFS/build/kernel.config

exit
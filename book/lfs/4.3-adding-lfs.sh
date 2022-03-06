#!/bin/bash
set -e
echo "4.3. Adding the LFS User"
 
groupadd lfs
useradd -s /bin/bash -g lfs -m -k /dev/null lfs

chown -v lfs $LFS/{usr{,/*},lib,var,etc,bin,sbin,tools}
case $(uname -m) in
  x86_64) chown -v lfs $LFS/lib64 ;;
esac

chown -v lfs $LFS/sources

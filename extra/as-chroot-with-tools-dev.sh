#!/bin/bash
set -e
echo "Continue with chroot environment.."
. /tools/.variables

# build toolchain
sh /tools/10.1-make-strace.sh
sh /tools/10.2-make-openssl.sh
sh /tools/10.3-make-openssh.sh
sh /tools/10.4-make-screen.sh
sh /tools/10.5-make-apr.sh
sh /tools/10.6-make-apr-util.sh
sh /tools/10.7-make-ca.sh
sh /tools/10.8-make-wget.sh
sh /tools/10.9-make-curl.sh
sh /tools/10.10-make-pcre.sh
sh /tools/10.12-make-ntp.sh
sh /tools/10.13-make-blfs-bootscripts.sh
sh /tools/10.14-make-sqlite.sh
sh /tools/10.26-make-neon.sh
sh /tools/10.15-make-subversion.sh
sh /tools/10.16-make-cpio.sh
sh /tools/10.17-make-valgrind.sh
sh /tools/10.20-make-libpcap.sh
sh /tools/10.18-make-tcpdump.sh
sh /tools/10.19-make-tcpreplay.sh
sh /tools/10.25-make-xorriso.sh
sh /tools/10.28-make-parted.sh
sh /tools/10.21-strip.sh
sh /tools/10.22-enviroment.sh
sh /tools/10.23-enviroment-dev.sh
sh /tools/10.24-dev-shell-programs.sh

exit

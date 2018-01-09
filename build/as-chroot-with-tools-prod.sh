#!/bin/bash
set -e
echo "Continue with chroot environment.."
. /tools/.variables

# SKIP remove the "I have no name!" promp
# exec /tools/bin/bash --login +h

# build toolchain
sh /tools/6.5-create-directories.sh
sh /tools/6.6-create-essentials.sh
sh /tools/6.7-make-linux-api-headers.sh
sh /tools/6.8-make-man-pages.sh
sh /tools/6.9-make-glibc.sh
sh /tools/6.10-adjust-toolchain.sh
sh /tools/6.11-make-zlib.sh
sh /tools/6.12-make-file.sh
sh /tools/6.13-make-readline.sh
sh /tools/6.14-make-m4.sh
sh /tools/6.16-make-binutils.sh
sh /tools/6.17-make-gmp.sh
sh /tools/6.18-make-mpfr.sh
sh /tools/6.19-make-mpc.sh
sh /tools/6.73-make-gcc-prod.sh
sh /tools/6.21-make-bzip2.sh
sh /tools/6.22-make-pkg-config.sh
sh /tools/6.23-make-ncurses.sh
sh /tools/6.26-make-libcap.sh
sh /tools/6.27-make-sed.sh
sh /tools/6.28-make-shadow.sh
sh /tools/6.29-make-psmisc.sh
sh /tools/6.30-make-iana-etc.sh
sh /tools/6.31-make-bison.sh
sh /tools/6.32-make-flex.sh
sh /tools/6.33-make-grep.sh
sh /tools/6.34-make-bash.sh

# SKIP switching to built bash
#exec /bin/bash --login +h

sh /tools/6.35-make-libtool.sh
sh /tools/6.36-make-gdbm.sh
sh /tools/6.38-make-expat.sh
sh /tools/6.39-make-inetutils.sh
sh /tools/6.45-make-xz.sh
sh /tools/6.48-make-procps-ng.sh
sh /tools/6.49-make-e2fsprogs.sh
sh /tools/6.50-make-coreutils.sh
sh /tools/6.51-make-diffutils.sh
sh /tools/6.52-make-gawk.sh
sh /tools/6.53-make-findutils.sh
sh /tools/6.56-make-less.sh
sh /tools/6.57-make-gzip.sh
sh /tools/6.58-make-iproute2.sh
sh /tools/6.59-make-kbd.sh
sh /tools/6.63-make-sysklogd.sh
sh /tools/6.64-make-sysvinit.sh
sh /tools/6.65-make-eudev.sh
sh /tools/6.66-make-util-linux.sh
sh /tools/6.68-make-tar.sh
sh /tools/6.70-make-vim.sh
sh /tools/6.74-strip-prod.sh
sh /tools/6.72-clean.sh

exit

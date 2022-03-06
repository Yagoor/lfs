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

run_as_chroot2 () {
    chroot "$LFS" /usr/bin/env -i          \
        HOME=/root TERM="$TERM"            \
        PS1='(lfs chroot) \u:\w\$ '        \
        PATH=/usr/bin:/usr/sbin            \
        /bin/bash --login                  \
        -c "sh $1"
}

pushd $LFS/sources

run_as_chroot /build/8.3-make-man-pages.sh
run_as_chroot /build/8.4-make-iana-etc.sh
run_as_chroot /build/8.5-make-glibc.sh
run_as_chroot /build/8.6-make-zlib.sh
run_as_chroot /build/8.7-make-bzip2.sh
run_as_chroot /build/8.8-make-xz.sh
run_as_chroot /build/8.9-make-zstd.sh
run_as_chroot /build/8.10-make-file.sh
run_as_chroot /build/8.11-make-readline.sh
run_as_chroot /build/8.12-make-m4.sh
run_as_chroot /build/8.13-make-bc.sh
run_as_chroot /build/8.14-make-flex.sh
run_as_chroot /build/8.15-make-tcl.sh
run_as_chroot /build/8.16-make-expect.sh
run_as_chroot /build/8.17-make-dejagnu.sh
run_as_chroot /build/8.18-make-binutils.sh
run_as_chroot /build/8.19-make-gmp.sh
run_as_chroot /build/8.20-make-mpfr.sh
run_as_chroot /build/8.21-make-mpc.sh
run_as_chroot /build/8.22-make-attr.sh
run_as_chroot /build/8.23-make-acl.sh
run_as_chroot /build/8.24-make-libcap.sh
run_as_chroot /build/8.25-make-shadow.sh
run_as_chroot /build/8.26-make-gcc.sh
run_as_chroot /build/8.27-make-pkg-config.sh
run_as_chroot /build/8.28-make-ncurses.sh
run_as_chroot /build/8.29-make-sed.sh
run_as_chroot /build/8.30-make-psmisc.sh
run_as_chroot /build/8.31-make-gettext.sh
run_as_chroot /build/8.32-make-bison.sh
run_as_chroot /build/8.33-make-grep.sh
run_as_chroot /build/8.34-make-bash.sh
run_as_chroot /build/8.35-make-libtool.sh
run_as_chroot /build/8.36-make-gdbm.sh
run_as_chroot /build/8.37-make-gperf.sh
run_as_chroot /build/8.38-make-expat.sh
run_as_chroot /build/8.39-make-inetutils.sh
run_as_chroot /build/8.40-make-less.sh
run_as_chroot /build/8.41-make-perl.sh
run_as_chroot /build/8.42-make-xml-parser.sh
run_as_chroot /build/8.43-make-xml-intltool.sh
run_as_chroot /build/8.44-make-autoconf.sh
run_as_chroot /build/8.45-make-automake.sh
run_as_chroot /build/8.46-make-openssl.sh
run_as_chroot /build/8.47-make-kmod.sh
run_as_chroot /build/8.48-make-libelf.sh
run_as_chroot /build/8.49-make-libffi.sh
run_as_chroot /build/8.50-make-python.sh
run_as_chroot /build/8.51-make-ninja.sh
run_as_chroot /build/8.52-make-meson.sh
run_as_chroot /build/8.53-make-coreutils.sh
run_as_chroot /build/8.54-make-check.sh
run_as_chroot /build/8.55-make-diffutils.sh
run_as_chroot /build/8.56-make-gawk.sh
run_as_chroot /build/8.57-make-findutils.sh
run_as_chroot /build/8.58-make-groff.sh
run_as_chroot /build/8.59-make-grub.sh
run_as_chroot /build/8.60-make-gzip.sh
run_as_chroot /build/8.61-make-iproute2.sh
run_as_chroot /build/8.62-make-kbd.sh
run_as_chroot /build/8.63-make-libpipeline.sh
run_as_chroot /build/8.64-make-make.sh
run_as_chroot /build/8.65-make-patch.sh
run_as_chroot /build/8.66-make-tar.sh
run_as_chroot /build/8.67-make-texinfo.sh
run_as_chroot /build/8.68-make-vim.sh
run_as_chroot /build/8.69-make-eudev.sh
run_as_chroot /build/8.70-make-man-db.sh
run_as_chroot /build/8.71-make-procps-ng.sh
run_as_chroot /build/8.72-make-util-linux.sh
run_as_chroot /build/8.73-make-e2fsprogs.sh
run_as_chroot /build/8.74-make-sysklogd.sh
run_as_chroot /build/8.75-make-sysvinit.sh
run_as_chroot /build/8.77-stripping.sh

run_as_chroot2 /build/8.78-cleaning.sh

popd

exit

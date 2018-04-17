#!/bin/bash
set -e
echo "Downloading toolchain..."

pushd $LFS/sources

case "$FETCH_TOOLCHAIN_MODE" in
"0")
	echo "Deprecated..."
	false
	;;
"1")
	echo "Deprecated..."
	false
	;;
"2")
	echo "Deprecated..."
	false
	;;
"3")
	echo "Deprecated..."
	false
	;;

"4")
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/binutils-2.29.tar.bz2
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/gcc-7.2.0.tar.xz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/linux-4.12.7.tar.xz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/glibc-2.26.tar.xz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/tcl-core8.6.7-src.tar.gz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/expect5.45.tar.gz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/dejagnu-1.6.tar.gz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/check-0.11.0.tar.gz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/ncurses-6.0.tar.gz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/bash-4.4.tar.gz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/bison-3.0.4.tar.xz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/bzip2-1.0.6.tar.gz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/coreutils-8.27.tar.xz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/diffutils-3.6.tar.xz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/file-5.31.tar.gz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/findutils-4.6.0.tar.gz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/gawk-4.1.4.tar.xz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/gettext-0.19.8.1.tar.xz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/grep-3.1.tar.xz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/gzip-1.8.tar.xz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/m4-1.4.18.tar.xz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/make-4.2.1.tar.bz2
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/patch-2.7.5.tar.xz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/perl-5.26.0.tar.xz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/sed-4.4.tar.xz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/tar-1.29.tar.xz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/texinfo-6.4.tar.xz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/util-linux-2.30.1.tar.xz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/xz-5.2.3.tar.xz

        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/man-pages-4.12.tar.xz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/tzdata2017b.tar.gz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/zlib-1.2.11.tar.xz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/readline-7.0.tar.gz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/bc-1.07.1.tar.gz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/gmp-6.1.2.tar.xz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/mpfr-3.1.5.tar.xz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/mpc-1.0.3.tar.gz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/pkg-config-0.29.2.tar.gz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/attr-2.4.47.src.tar.gz
	wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/acl-2.2.52.src.tar.gz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/libcap-2.25.tar.xz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/shadow-4.5.tar.xz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/psmisc-23.1.tar.xz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/iana-etc-2.30.tar.bz2
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/flex-2.6.4.tar.gz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/libtool-2.4.6.tar.xz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/gdbm-1.13.tar.gz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/gperf-3.1.tar.gz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/expat-2.2.3.tar.bz2
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/inetutils-1.9.4.tar.xz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/XML-Parser-2.44.tar.gz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/intltool-0.51.0.tar.gz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/autoconf-2.69.tar.xz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/automake-1.15.1.tar.xz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/kmod-24.tar.xz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/procps-ng-3.3.12.tar.xz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/e2fsprogs-1.43.5.tar.gz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/groff-1.22.3.tar.gz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/grub-2.02.tar.xz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/less-487.tar.gz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/iproute2-4.12.0.tar.xz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/kbd-2.0.4.tar.xz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/libpipeline-1.4.2.tar.gz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/sysklogd-1.5.1.tar.gz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/sysvinit-2.88dsf.tar.bz2
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/eudev-3.2.2.tar.gz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/udev-lfs-20140408.tar.bz2
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/man-db-2.7.6.1.tar.xz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/vim-8.0.586.tar.bz2

        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/lfs-bootscripts-20170626.tar.bz2

        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/strace-4.20.tar.xz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/openssl-1.1.0f.tar.gz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/openssh-7.5p1.tar.gz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/screen-4.5.1.tar.gz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/certdata.txt
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/apr-1.6.2.tar.bz2
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/apr-util-1.6.0.tar.bz2
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/make-ca.sh-20170514
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/wget-1.19.1.tar.xz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/curl-7.55.1.tar.xz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/pcre-8.41.tar.bz2
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/ntp-4.2.8p10.tar.gz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/parted-3.2.tar.xz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/blfs-bootscripts-20170731.tar.xz

        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/sqlite-autoconf-3200000.tar.gz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/neon-0.29.6.tar.gz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/subversion-1.7.9.tar.gz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/valgrind-3.13.0.tar.bz2
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/libpcap-1.8.1.tar.gz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/tcpdump-4.9.2.tar.gz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/tcpreplay-4.2.6.tar.gz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/xorriso-1.4.8.tar.gz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/git-2.14.1.tar.xz
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/cpio-2.12.tar.bz2


        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/bash-4.4-upstream_fixes-1.patch
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/bzip2-1.0.6-install_docs-1.patch
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/coreutils-8.27-i18n-1.patch
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/glibc-2.26-fhs-1.patch
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/kbd-2.0.4-backspace-1.patch
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/libpcap-1.8.1-enable_bluetooth-1.patch
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/openssh-7.5p1-openssl-1.1.0-1.patch
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/parted-3.2-devmapper-1.patch
        wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/sysvinit-2.88dsf-consolidated-1.patch

        #wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/syslinux-6.03.tar.xz
        #wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/systemd-234-lfs.tar.xz
        #wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/dbus-1.10.22.tar.gz
        #wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/httpd-2.4.27-blfs_layout-1.patch
        #wget --timestamping --user $GIT_USER --password $GIT_PASSWORD $GIT_ROSARIOS_DOWNLOADS/httpd-2.4.27.tar.bz2
        ;;
*)
	echo "Undefined way to get toolchain!"
	false
	;;
esac

popd

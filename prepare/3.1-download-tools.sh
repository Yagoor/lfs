#!/bin/bash
set -e
echo "Downloading toolchain.."

pushd $LFS/sources

case "$FETCH_TOOLCHAIN_MODE" in
"0")
	echo "Downloading LFS packages.."
	echo "Getting wget-list.."
	wget --timestamping http://www.linuxfromscratch.org/lfs/view/8.1/wget-list

	echo "Getting packages.."
	wget --timestamping --continue --input-file=wget-list

	echo "Getting md5.."
	wget --timestamping http://www.linuxfromscratch.org/lfs/downloads/8.1/md5sums

	echo "Check hashes.."
	md5sum -c md5sums

	echo "Downloading syslinux package.."
	wget --timestamping https://www.kernel.org/pub/linux/utils/boot/syslinux/syslinux-6.03.tar.xz
	echo "Check hash.."
	echo "26d3986d2bea109d5dc0e4f8c4822a459276cf021125e8c9f23c3cca5d8c850e $LFS/sources/syslinux-6.03.tar.xz" | sha256sum -c -

	echo "Downloading extra packages.."
	wget --timestamping https://sourceforge.net/projects/strace/files/strace/4.20/strace-4.20.tar.xz/download -O strace-4.20.tar.xz
	wget --timestamping https://openssl.org/source/openssl-1.1.0f.tar.gz 
	wget --timestamping http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-7.5p1.tar.gz 
	wget --timestamping https://ftp.gnu.org/gnu/screen/screen-4.5.1.tar.gz 
	wget --timestamping https://archive.apache.org/dist/apr/apr-1.6.2.tar.bz2 
	wget --timestamping https://archive.apache.org/dist/apr/apr-util-1.6.0.tar.bz2 
	wget --timestamping http://anduin.linuxfromscratch.org/BLFS/other/certdata.txt 
	wget --timestamping http://anduin.linuxfromscratch.org/BLFS/other/make-ca.sh-20170514 
	wget --timestamping https://ftp.gnu.org/gnu/wget/wget-1.19.1.tar.xz 
	wget --timestamping https://curl.haxx.se/download/curl-7.55.1.tar.xz 
	wget --timestamping https://downloads.sourceforge.net/pcre/pcre-8.41.tar.bz2 
	wget --timestamping http://ftp.postgresql.org/pub/source/v9.6.4/postgresql-9.6.4.tar.bz2 
	wget --timestamping https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-4.2.8p10.tar.gz 
	wget --timestamping http://anduin.linuxfromscratch.org/BLFS/blfs-bootscripts/blfs-bootscripts-20170731.tar.xz 
	wget --timestamping https://ftp.gnu.org/gnu/cpio/cpio-2.12.tar.bz2
	wget --timestamping https://sqlite.org/2017/sqlite-autoconf-3200000.tar.gz 
	wget --timestamping https://archive.apache.org/dist/subversion/subversion-1.7.9.tar.gz 
	wget --timestamping https://sourceware.org/ftp/valgrind/valgrind-3.13.0.tar.bz2
	wget --timestamping http://www.tcpdump.org/release/libpcap-1.8.1.tar.gz 
	wget --timestamping https://www.tcpdump.org/release/tcpdump-4.9.2.tar.gz 
	wget --timestamping https://sourceforge.net/projects/tcpreplay/files/tcpreplay/4.2.6/tcpreplay-4.2.6.tar.gz/download -O tcpreplay-4.2.6.tar.gz
	wget --timestamping https://archive.apache.org/dist/httpd/httpd-2.4.27.tar.bz2 
	wget --timestamping https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-3.6.1.tgz 
	wget --timestamping https://www.gnu.org/software/xorriso/xorriso-1.4.8.tar.gz 
	wget --timestamping https://src.fedoraproject.org/repo/pkgs/neon/neon-0.29.6.tar.gz/591e0c82e6979e7e615211b386b8f6bc/neon-0.29.6.tar.gz 
	wget --timestamping https://ftp.gnu.org/gnu/parted/parted-3.2.tar.xz 

	#echo "Check hash.. TODO"

	echo "Downloading extra packages patches.."
	wget --timestamping http://www.linuxfromscratch.org/patches/blfs/8.1/openssh-7.5p1-openssl-1.1.0-1.patch 
	wget --timestamping http://www.linuxfromscratch.org/patches/blfs/8.1/httpd-2.4.27-blfs_layout-1.patch 
	wget --timestamping http://www.linuxfromscratch.org/patches/blfs/8.1/libpcap-1.8.1-enable_bluetooth-1.patch 
	wget --timestamping http://www.linuxfromscratch.org/patches/blfs/8.1/parted-3.2-devmapper-1.patch 
	;;
"1")
	echo "Assume toolchain from host is already placed in sources folder"
	;;
"2")
	wget --timestamping https://github.com/reinterpretcat/lfs/releases/download/v8.1.0/toolchain.tar.gz
	tar -xvf toolchain.tar.gz
	rm toolchain.tar.gz
	;;
"3")
        wget --timestamping $SAMBA/sources/acl-2.2.52.src.tar.gz
        wget --timestamping $SAMBA/sources/apr-1.6.2.tar.bz2
        wget --timestamping $SAMBA/sources/apr-util-1.6.0.tar.bz2
        wget --timestamping $SAMBA/sources/attr-2.4.47.src.tar.gz
        wget --timestamping $SAMBA/sources/autoconf-2.69.tar.xz
        wget --timestamping $SAMBA/sources/automake-1.15.1.tar.xz
        wget --timestamping $SAMBA/sources/bash-4.4.tar.gz
        wget --timestamping $SAMBA/sources/bash-4.4-upstream_fixes-1.patch
        wget --timestamping $SAMBA/sources/bc-1.07.1.tar.gz
        wget --timestamping $SAMBA/sources/binutils-2.29.tar.bz2
        wget --timestamping $SAMBA/sources/bison-3.0.4.tar.xz
        wget --timestamping $SAMBA/sources/blfs-bootscripts-20170731.tar.xz
        wget --timestamping $SAMBA/sources/bzip2-1.0.6-install_docs-1.patch
        wget --timestamping $SAMBA/sources/bzip2-1.0.6.tar.gz
        wget --timestamping $SAMBA/sources/certdata.txt
        wget --timestamping $SAMBA/sources/check-0.11.0.tar.gz
        wget --timestamping $SAMBA/sources/coreutils-8.27-i18n-1.patch
        wget --timestamping $SAMBA/sources/coreutils-8.27.tar.xz
        wget --timestamping $SAMBA/sources/cpio-2.12.tar.bz2
        wget --timestamping $SAMBA/sources/curl-7.55.1.tar.xz
        wget --timestamping $SAMBA/sources/dbus-1.10.22.tar.gz
        wget --timestamping $SAMBA/sources/dejagnu-1.6.tar.gz
        wget --timestamping $SAMBA/sources/diffutils-3.6.tar.xz
        wget --timestamping $SAMBA/sources/e2fsprogs-1.43.5.tar.gz
        wget --timestamping $SAMBA/sources/eudev-3.2.2.tar.gz
        wget --timestamping $SAMBA/sources/expat-2.2.3.tar.bz2
        wget --timestamping $SAMBA/sources/expect5.45.tar.gz
        wget --timestamping $SAMBA/sources/file-5.31.tar.gz
        wget --timestamping $SAMBA/sources/findutils-4.6.0.tar.gz
        wget --timestamping $SAMBA/sources/flex-2.6.4.tar.gz
        wget --timestamping $SAMBA/sources/gawk-4.1.4.tar.xz
        wget --timestamping $SAMBA/sources/gcc-7.2.0.tar.xz
        wget --timestamping $SAMBA/sources/gdbm-1.13.tar.gz
        wget --timestamping $SAMBA/sources/gettext-0.19.8.1.tar.xz
        wget --timestamping $SAMBA/sources/glibc-2.26-fhs-1.patch
        wget --timestamping $SAMBA/sources/glibc-2.26.tar.xz
        wget --timestamping $SAMBA/sources/gmp-6.1.2.tar.xz
        wget --timestamping $SAMBA/sources/gperf-3.1.tar.gz
        wget --timestamping $SAMBA/sources/grep-3.1.tar.xz
        wget --timestamping $SAMBA/sources/groff-1.22.3.tar.gz
        wget --timestamping $SAMBA/sources/grub-2.02.tar.xz
        wget --timestamping $SAMBA/sources/gzip-1.8.tar.xz
        wget --timestamping $SAMBA/sources/httpd-2.4.27-blfs_layout-1.patch
        wget --timestamping $SAMBA/sources/httpd-2.4.27.tar.bz2
        wget --timestamping $SAMBA/sources/iana-etc-2.30.tar.bz2
        wget --timestamping $SAMBA/sources/inetutils-1.9.4.tar.xz
        wget --timestamping $SAMBA/sources/intltool-0.51.0.tar.gz
        wget --timestamping $SAMBA/sources/iproute2-4.12.0.tar.xz
        wget --timestamping $SAMBA/sources/kbd-2.0.4-backspace-1.patch
        wget --timestamping $SAMBA/sources/kbd-2.0.4.tar.xz
        wget --timestamping $SAMBA/sources/kmod-24.tar.xz
        wget --timestamping $SAMBA/sources/less-487.tar.gz
        wget --timestamping $SAMBA/sources/lfs-bootscripts-20170626.tar.bz2
        wget --timestamping $SAMBA/sources/libcap-2.25.tar.xz
        wget --timestamping $SAMBA/sources/libpcap-1.8.1-enable_bluetooth-1.patch
        wget --timestamping $SAMBA/sources/libpcap-1.8.1.tar.gz
        wget --timestamping $SAMBA/sources/libpipeline-1.4.2.tar.gz
        wget --timestamping $SAMBA/sources/libtool-2.4.6.tar.xz
        wget --timestamping $SAMBA/sources/linux-4.12.7.tar.xz
        wget --timestamping $SAMBA/sources/m4-1.4.18.tar.xz
        wget --timestamping $SAMBA/sources/make-4.2.1.tar.bz2
        wget --timestamping $SAMBA/sources/make-ca.sh-20170514
        wget --timestamping $SAMBA/sources/man-db-2.7.6.1.tar.xz
        wget --timestamping $SAMBA/sources/man-pages-4.12.tar.xz
        wget --timestamping $SAMBA/sources/mongodb-linux-x86_64-3.6.1.tgz
        wget --timestamping $SAMBA/sources/mpc-1.0.3.tar.gz
        wget --timestamping $SAMBA/sources/mpfr-3.1.5.tar.xz
        wget --timestamping $SAMBA/sources/ncurses-6.0.tar.gz
        wget --timestamping $SAMBA/sources/neon-0.29.6.tar.gz
        wget --timestamping $SAMBA/sources/ntp-4.2.8p10.tar.gz
        wget --timestamping $SAMBA/sources/openssh-7.5p1-openssl-1.1.0-1.patch
        wget --timestamping $SAMBA/sources/openssh-7.5p1.tar.gz
        wget --timestamping $SAMBA/sources/openssl-1.1.0f.tar.gz
        wget --timestamping $SAMBA/sources/parted-3.2-devmapper-1.patch
        wget --timestamping $SAMBA/sources/parted-3.2.tar.xz
        wget --timestamping $SAMBA/sources/patch-2.7.5.tar.xz
        wget --timestamping $SAMBA/sources/pcre-8.41.tar.bz2
        wget --timestamping $SAMBA/sources/perl-5.26.0.tar.xz
        wget --timestamping $SAMBA/sources/pkg-config-0.29.2.tar.gz
        wget --timestamping $SAMBA/sources/postgresql-9.6.4.tar.bz2
        wget --timestamping $SAMBA/sources/procps-ng-3.3.12.tar.xz
        wget --timestamping $SAMBA/sources/psmisc-23.1.tar.xz
        wget --timestamping $SAMBA/sources/readline-7.0.tar.gz
        wget --timestamping $SAMBA/sources/screen-4.5.1.tar.gz
        wget --timestamping $SAMBA/sources/sed-4.4.tar.xz
        wget --timestamping $SAMBA/sources/shadow-4.5.tar.xz
        wget --timestamping $SAMBA/sources/sqlite-autoconf-3200000.tar.gz
        wget --timestamping $SAMBA/sources/strace-4.20.tar.xz
        wget --timestamping $SAMBA/sources/subversion-1.7.9.tar.gz
        wget --timestamping $SAMBA/sources/sysklogd-1.5.1.tar.gz
        wget --timestamping $SAMBA/sources/syslinux-6.03.tar.xz
        wget --timestamping $SAMBA/sources/systemd-234-lfs.tar.xz
        wget --timestamping $SAMBA/sources/sysvinit-2.88dsf-consolidated-1.patch
        wget --timestamping $SAMBA/sources/sysvinit-2.88dsf.tar.bz2
        wget --timestamping $SAMBA/sources/tar-1.29.tar.xz
        wget --timestamping $SAMBA/sources/tcl-core8.6.7-src.tar.gz
        wget --timestamping $SAMBA/sources/tcpdump-4.9.2.tar.gz
        wget --timestamping $SAMBA/sources/tcpreplay-4.2.6.tar.gz
        wget --timestamping $SAMBA/sources/texinfo-6.4.tar.xz
        wget --timestamping $SAMBA/sources/tzdata2017b.tar.gz
        wget --timestamping $SAMBA/sources/udev-lfs-20140408.tar.bz2
        wget --timestamping $SAMBA/sources/util-linux-2.30.1.tar.xz
        wget --timestamping $SAMBA/sources/valgrind-3.13.0.tar.bz2
        wget --timestamping $SAMBA/sources/vim-8.0.586.tar.bz2
        wget --timestamping $SAMBA/sources/wget-1.19.1.tar.xz
        wget --timestamping $SAMBA/sources/XML-Parser-2.44.tar.gz
        wget --timestamping $SAMBA/sources/xorriso-1.4.8.tar.gz
        wget --timestamping $SAMBA/sources/xz-5.2.3.tar.xz
        wget --timestamping $SAMBA/sources/zlib-1.2.11.tar.xz
        ;;
*)
	echo "Undefined way to get toolchain!"
	false
	;;
esac

popd

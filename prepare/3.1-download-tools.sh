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

	#echo "Check hash.. TODO"

	echo "Downloading extra packages patches.."
	wget --timestamping http://www.linuxfromscratch.org/patches/blfs/8.1/openssh-7.5p1-openssl-1.1.0-1.patch 
	wget --timestamping http://www.linuxfromscratch.org/patches/blfs/8.1/httpd-2.4.27-blfs_layout-1.patch 
	wget --timestamping http://www.linuxfromscratch.org/patches/blfs/8.1/libpcap-1.8.1-enable_bluetooth-1.patch 
	;;
"1")
	echo "Assume toolchain from host is already placed in sources folder"
	;;
"2")
	wget --timestamping https://github.com/reinterpretcat/lfs/releases/download/v8.1.0/toolchain.tar.gz
	tar -xvf toolchain.tar.gz
	rm toolchain.tar.gz
	;;
*)
	echo "Undefined way to get toolchain!"
	false
	;;
esac

popd

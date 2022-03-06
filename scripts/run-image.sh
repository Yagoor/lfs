#!/bin/bash
set -e

. /build/.variables

IMAGE_SIZE=1400000
LOOP=/dev/loop6
INITRD_TREE=$LFS
IMAGE=isolinux/ramdisk.img

pushd /tmp
mkdir -p isolinux

# extract syslinux
wget --continue --directory-prefix=$LFS/sources https://cdn.kernel.org/pub/linux/utils/boot/syslinux/syslinux-6.03.tar.xz
tar -xf $LFS/sources/syslinux-6.03.tar.xz -C /tmp/
mv /tmp/syslinux-6.03 /tmp/syslinux
# copy needed syslinux binaries
cp /tmp/syslinux/bios/core/isolinux.bin isolinux/isolinux.bin
cp /tmp/syslinux/bios/com32/elflink/ldlinux/ldlinux.c32 isolinux/ldlinux.c32
cp /tmp/syslinux/bios/mbr/isohdpfx.bin isolinux/isohdpfx.bin
# cleanup
rm -rf /tmp/syslinux

cat > isolinux/isolinux.cfg <<"EOF"
DEFAULT lfs
PROMPT 0

LABEL lfs
    KERNEL vmlinuz
    APPEND initrd=ramdisk.img root=/dev/ram0 3
EOF

# create ramdisk file of IMAGE_SIZE
dd if=/dev/zero of=ramdisk bs=1k count=$IMAGE_SIZE

# associate it with ${LOOP}
losetup ${LOOP} ramdisk

# make an ext2 filesystem
mke2fs -q -i 16384 -m 0 ${LOOP} $IMAGE_SIZE

# ensure loop2 directory
mkdir -p loop2

# mount it
mount ${LOOP} loop2
rm -rf loop2/lost+found

# copy LFS system without build artifacts
LOOP_DIR=$(pwd)/loop2
pushd $INITRD_TREE
cp -dpR $(ls -A | grep -Ev "sources|build") $LOOP_DIR
popd

# show statistics
df loop2

echo "Compressing system ramdisk image.."
sleep 1 ; sync ; sleep 1
gzip -c ramdisk > $IMAGE 

# cleanup
umount loop2
losetup -d ${LOOP}
rm  -rf loop2
rm -f ramdisk

# copy kernel to isolinux folder
cp $LFS/boot/vmlinuz-* isolinux/vmlinuz

# build iso
xorriso -as mkisofs \
    -D -r -J -joliet-long -l -V "Custom Install CD" \
    -b isolinux/isolinux.bin \
    -c isolinux/boot.cat \
    -iso-level 3 -no-emul-boot -partition_offset 16 -boot-load-size 4 -boot-info-table \
    -isohybrid-mbr isolinux/isohdpfx.bin \
    -o lfs.iso .

echo -ne "ros " | dd of=lfs.iso conv=notrunc seek=440 oflag=seek_bytes 2>/dev/null

# ISO Mapping
#
# 0 - 511 			-> MBR
# 511 - 1073742335 		-> Space for System
# 1073742336 - 2147483648 	-> Space for Extra stuff 
# 					-- IF YOU ADD SOMETHING INTO EXTRA MAP HERE
# 

echo "Image is created: $(pwd)/lfs.iso"

rm -rf isolinux
popd

exit

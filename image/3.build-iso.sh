#!/bin/bash
set -e
echo "Building bootable iso.."

# copy kernel to isolinux folder
cp $LFS/boot/vmlinuz-* isolinux/vmlinuz

# build iso
xorriso -as mkisofs \
    -D -r -J -joliet-long -l -V "Custom Install CD" \
    -b isolinux/isolinux.bin \
    -c isolinux/boot.cat \
    -iso-level 3 -no-emul-boot -partition_offset 16 -boot-load-size 4 -boot-info-table \
    -isohybrid-mbr /usr/lib/syslinux/isohdpfx.bin \
    -o lfs.iso .

echo "Image is created: $(pwd)/lfs.iso"

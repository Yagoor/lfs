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

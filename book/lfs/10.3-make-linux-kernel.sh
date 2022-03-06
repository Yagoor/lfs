#!/bin/bash
set -e

tar -xf /sources/linux-5.16.9.tar.xz -C /tmp/
mv /tmp/linux-5.16.9 /tmp/linux
pushd /tmp/linux

make mrproper

cp /build/kernel.config .config

make

make modules_install

cp -iv arch/x86/boot/bzImage /boot/vmlinuz-5.16.9-lfs-11.1

cp -iv System.map /boot/System.map-5.16.9

cp -iv .config /boot/config-5.16.9

install -d /usr/share/doc/linux-5.16.9
cp -r Documentation/* /usr/share/doc/linux-5.16.9

install -v -m755 -d /etc/modprobe.d
cat > /etc/modprobe.d/usb.conf << "EOF"
# Begin /etc/modprobe.d/usb.conf

install ohci_hcd /sbin/modprobe ehci_hcd ; /sbin/modprobe -i ohci_hcd ; true
install uhci_hcd /sbin/modprobe ehci_hcd ; /sbin/modprobe -i uhci_hcd ; true

# End /etc/modprobe.d/usb.conf
EOF

popd
rm -rf /tmp/linux

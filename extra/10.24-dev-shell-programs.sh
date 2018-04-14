#!/bin/bash
set -e
echo "Creating shell programs for developers..."

cat > /usr/bin/dev << "EOF"
#!/bin/bash

if ! mount | grep /dev/sdb1 ; then
	( echo "n" ; echo "p" ; echo "2" ; echo ""; echo "+2G" ; echo "n" ; echo "p" ; echo "1" ; echo "" ; echo "" ; echo "w" ) | fdisk /dev/sdb
        mkfs.ext4 -F /dev/sdb1
	mkswap /dev/sdb2
        mount /dev/sdb1 /home/dev
	swapon /dev/sdb2
fi

read -p "Username: " username

if ! ls /home/dev | grep $username ; then
	useradd -d /home/dev/$username -m $username
	passwd $username
	cp /root/.bashrc /home/dev/$username/
	cp /root/.bash_profile /home/dev/$username/
	chown -R $username:$username /home/dev/$username/
	cp /etc/passwd /home/dev/.passwd
	cp /etc/group /home/dev/.group
	cp /etc/shadow /home/dev/.shadow
fi

if [ ! -e /home/dev/.startup ] ; then
	read -p "IP: " ip
	read -p "Mask: " mask
	read -p "Interface: " interface
	read -p "Gateway: " gateway

	echo '#!/bin/bash' > /home/dev/.startup
	echo "" >> /home/dev/.startup
	echo "ip addr add $ip/$mask dev $interface" >> /home/dev/.startup
	echo "ip link set $interface up" >> /home/dev/.startup
	echo "ip route add default via $gateway" >> /home/dev/.startup
	echo "echo \"nameserver 8.8.8.8\" > /etc/resolv.conf" >> /home/dev/.startup

	chmod a+x /home/dev/.startup
	/home/dev/.startup
fi

EOF

chmod a+x /usr/bin/dev


#!/bin/bash
set -e
echo "Setup general network configuration.."

# 7.5.2 DNS configuration
cat > /etc/resolv.conf <<"EOF"
nameserver 8.8.8.8
nameserver 8.8.4.4
EOF

# 7.5.3 configure system hostname
echo "RosariOS" > /etc/hostname

# 7.5.4 /etc/hosts file
cat > /etc/hosts <<"EOF"
127.0.0.1 localhost
::1     localhost ip6-localhost ip6-loopback
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
EOF

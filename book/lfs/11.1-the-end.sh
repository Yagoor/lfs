#!/bin/bash
set -e

echo 11.1 > /etc/lfs-release

cat > /etc/lsb-release << "EOF"
DISTRIB_ID="Linux From Scratch"
DISTRIB_RELEASE="11.1"
DISTRIB_CODENAME="<your name here>"
DISTRIB_DESCRIPTION="Linux From Scratch"
EOF

cat > /etc/os-release << "EOF"
NAME="Linux From Scratch"
VERSION="11.1"
ID=lfs
PRETTY_NAME="Linux From Scratch 11.1"
VERSION_CODENAME="<your name here>"
EOF
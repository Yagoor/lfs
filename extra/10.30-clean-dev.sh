#!/bin/bash
set -e
echo "Cleaning..."

find / -iname "*.a" -exec rm -f {} \;
rm -rf /usr/share/{doc,man}/* 


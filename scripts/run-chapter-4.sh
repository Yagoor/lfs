#!/bin/bash
set -e

. /build/.variables

sh /build/4.2-directory-layout.sh
sh /build/4.3-adding-lfs.sh
su lfs -c "/build/4.4-setting-environment.sh"

exit

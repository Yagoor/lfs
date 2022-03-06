#!/bin/bash
set -e

. /build/.variables

run_as_lfs () {
    su lfs -c "source ~/.bashrc && sh $1"
}

pushd $LFS/sources

run_as_lfs /build/5.2-make-binutils.sh
run_as_lfs /build/5.3-make-gcc.sh
run_as_lfs /build/5.4-make-linux-api-headers.sh
run_as_lfs /build/5.5-make-glibc.sh
run_as_lfs /build/5.6-make-libstdc.sh

popd

exit

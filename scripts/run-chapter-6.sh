#!/bin/bash
set -e

. /build/.variables

run_as_lfs () {
    su lfs -c "source ~/.bashrc && sh $1"
}

pushd $LFS/sources

run_as_lfs /build/6.2-make-m4.sh
run_as_lfs /build/6.3-make-ncurses.sh
run_as_lfs /build/6.4-make-bash.sh
run_as_lfs /build/6.5-make-coreutils.sh
run_as_lfs /build/6.6-make-diffutils.sh
run_as_lfs /build/6.7-make-file.sh
run_as_lfs /build/6.8-make-findutils.sh
run_as_lfs /build/6.9-make-gawk.sh
run_as_lfs /build/6.10-make-grep.sh
run_as_lfs /build/6.11-make-gzip.sh
run_as_lfs /build/6.12-make-make.sh
run_as_lfs /build/6.13-make-patch.sh
run_as_lfs /build/6.14-make-sed.sh
run_as_lfs /build/6.15-make-tar.sh
run_as_lfs /build/6.16-make-xz.sh
run_as_lfs /build/6.17-make-binutils.sh
run_as_lfs /build/6.18-make-gcc.sh

popd

exit

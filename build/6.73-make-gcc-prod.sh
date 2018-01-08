#!/bin/bash
set -e
echo "Building gcc.."
echo "Approximate build time: 82 SBU"
echo "Required disk space: 3.2 GB"

# 6.20. GCC package contains the GNU compiler collection, which
# includes the C and C++ compilers
tar -xf /sources/gcc-*.tar.xz -C /tmp/ \
  && mv /tmp/gcc-* /tmp/gcc \
  && pushd /tmp/gcc
# change the default directory name for 64-bit libraries to “lib”
case $(uname -m) in
  x86_64)
    sed -e '/m64=/s/lib64/lib/' -i.orig gcc/config/i386/t-linux64
  ;;
esac
# remove the symlink created earlier as the final gcc includes will be installed here
rm -f /usr/lib/gcc
# create build directory
mkdir -v build && cd build
# prepare for compilation
SED=sed                      \
../configure --prefix=/usr   \
    --enable-languages=c,c++ \
    --disable-multilib       \
    --disable-bootstrap      \
    --with-system-zlib
# compile package
make
# increase the stack size prior to running the tests
ulimit -s 32768
# test the results, but do not stop at errors
if [ $LFS_TEST -eq 1 ]; then
   make -k check || true
   # check results (manual)
   ../contrib/test_summary | grep -A7 Summ
fi
# install
make maybe-install-target-libstdc++-v3
popd \
  && rm -rf /tmp/gcc

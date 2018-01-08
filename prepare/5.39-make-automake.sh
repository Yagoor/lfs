#!/bin/bash
set -e
echo "Building automake.."
echo "Approximate build time: SBU"
echo "Required disk space:  MB"

# 6.44. Automake package contains programs for generating Makefiles
# for use with Autoconf
tar -xf automake-*.tar.xz -C /tmp/ 	\
  && mv /tmp/automake-* /tmp/automake 	\
  && pushd /tmp/automake 		\
  && ./configure --prefix=/tools 	\
  && make 				\
  && make install 			\
  && popd 				\
  && rm -rf /tmp/automake

#!/bin/bash
set -e
echo "Building expat.."
echo "Approximate build time: less than 0.1 SBU"
echo "Required disk space: 9.5 MB"

tar -xf expat-*.tar.bz2 -C /tmp/ 			\
  && mv /tmp/expat-* /tmp/expat 			\
  && pushd /tmp/expat 					\
  && ./configure --prefix=/tools --disable-static 	\
  && make 						\
  && make install 					\
  && popd 						\
  && rm -rf /tmp/expat

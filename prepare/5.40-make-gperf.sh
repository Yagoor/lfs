#!/bin/bash
set -e
echo "Building gperf.."
echo "Approximate build time: less than 0.1 SBU"
echo "Required disk space: 5.8 MB"

tar -xf gperf-*.tar.gz -C /tmp/ 		\
  && mv /tmp/gperf-* /tmp/gperf 		\
  && pushd /tmp/gperf 				\
  && ./configure --prefix=/tools 		\
  && make 					\
  && make install 				\
  && popd 					\
  && rm -rf /tmp/gperf

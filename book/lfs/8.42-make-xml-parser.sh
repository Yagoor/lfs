#!/bin/bash
set -e

tar -xf /sources/XML-Parser-2.46.tar.gz -C /tmp/
mv /tmp/XML-Parser-2.46 /tmp/XML-Parser
pushd /tmp/XML-Parser

perl Makefile.PL

make

make install

popd
rm -rf /tmp/XML-Parser

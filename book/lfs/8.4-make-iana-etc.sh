#!/bin/bash
set -e

tar -xf /sources/iana-etc-20220207.tar.gz -C /tmp/
mv /tmp/iana-etc-20220207 /tmp/iana-etc
pushd /tmp/iana-etc

cp services protocols /etc

popd
rm -rf /tmp/iana-etc

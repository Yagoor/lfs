#!/bin/bash
set -e
echo "Building sqlite..."

tar -xf /sources/sqlite-*.tar.gz -C /tmp/ \
&& mv /tmp/sqlite-* /tmp/sqlite \
&& pushd /tmp/sqlite

./configure --prefix=/usr --disable-static        \
            CFLAGS="-g -O2 -DSQLITE_ENABLE_FTS3=1 \
            -DSQLITE_ENABLE_COLUMN_METADATA=1     \
            -DSQLITE_ENABLE_UNLOCK_NOTIFY=1       \
            -DSQLITE_SECURE_DELETE=1              \
            -DSQLITE_ENABLE_DBSTAT_VTAB=1" &&
make

make install

popd \
  && rm -rf /tmp/sqlite

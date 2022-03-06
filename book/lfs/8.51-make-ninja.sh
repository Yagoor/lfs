#!/bin/bash
set -e

tar -xf /sources/ninja-1.10.2.tar.gz -C /tmp/
mv /tmp/ninja-1.10.2 /tmp/ninja
pushd /tmp/ninja

sed -i '/int Guess/a \
  int   j = 0;\
  char* jobs = getenv( "NINJAJOBS" );\
  if ( jobs != NULL ) j = atoi( jobs );\
  if ( j > 0 ) return j;\
' src/ninja.cc

python3 configure.py --bootstrap

install -vm755 ninja /usr/bin/
install -vDm644 misc/bash-completion /usr/share/bash-completion/completions/ninja
install -vDm644 misc/zsh-completion  /usr/share/zsh/site-functions/_ninja

popd
rm -rf /tmp/ninja

#!/bin/bash
set -e

tar -xf /sources/meson-0.61.1.tar.gz -C /tmp/
mv /tmp/meson-0.61.1 /tmp/meson
pushd /tmp/meson

python3 setup.py build

python3 setup.py install --root=dest
cp -rv dest/* /
install -vDm644 data/shell-completions/bash/meson /usr/share/bash-completion/completions/meson
install -vDm644 data/shell-completions/zsh/_meson /usr/share/zsh/site-functions/_meson

popd
rm -rf /tmp/meson

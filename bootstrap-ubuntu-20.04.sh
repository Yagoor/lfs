export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get upgrade -y
apt-get install -y build-essential texinfo m4 bison xorriso \
                    libncurses5-dev flex
ln -sf bash /bin/sh
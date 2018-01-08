#!/bin/bash
set -e
echo "The Bash Shell Startup Files For Development..."

cat > /root/.bash_profile << "EOF"
# Begin ~/.bash_profile

# Personal environment variables and startup programs.

# Personal aliases and functions should go in ~/.bashrc.  System wide
# environment variables and startup programs are in /etc/profile.
# System wide aliases and functions are in /etc/bashrc.

if [ -f "$HOME/.bashrc" ] ; then
        source $HOME/.bashrc
fi

# End ~/.bash_profile
EOF

cat > /root/.bashrc << "EOF"
# Begin ~/.bashrc

# Personal aliases and functions.
alias l="ls -lah"
alias ll="ls -lh"

if [ -f "/etc/bashrc" ] ; then
        source /etc/bashrc
fi

# End ~/.bashrc
EOF

/usr/bin/dircolors -p > /etc/dircolors

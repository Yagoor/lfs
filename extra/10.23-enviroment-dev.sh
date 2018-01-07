#!/bin/bash
set -e
echo "The Bash Shell Startup Files For Development..."

cat > /etc/rc.d/init.d/dev << "EOF"
#!/bin/bash

if [ ! -d /home/dev ] ; then
	mkdir /home/dev
fi

mount /dev/sdb1 /home/dev
swapon /dev/sdb2

if [ -e /home/dev/.passwd ] ; then
	cp /home/dev/.passwd /etc/passwd
	cp /home/dev/.shadow /etc/shadow
	cp /home/dev/.group /etc/group
	chmod 644 /etc/passwd
	chmod 400 /etc/shadow
	chmod 644 /etc/group
fi

if [ -x /home/dev/.startup ] ; then
	/home/dev/.startup
fi
EOF

chmod a+x /etc/rc.d/init.d/dev

ln -f -s ../init.d/dev /etc/rc.d/rc3.d/S99dev

cat > /root/.bash_profile << "EOF"
# Begin ~/.bash_profile

# Personal environment variables and startup programs.

export PTAH=104.196.113.124
export NEITH=35.196.62.84
export HAPI=10.0.0.24
export SVN=http://$PTAH

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
alias svnm="svn stat | grep -v ?"
alias svnd="svn diff"
alias svna="svn add"
alias svns="svn stat"
alias grepsvn="grep --exclude-dir=.svn"

if [ -f "/etc/bashrc" ] ; then
	source /etc/bashrc
fi

# End ~/.bashrc
EOF

/usr/bin/dircolors -p > /etc/dircolors

sed -i 's/#PermitRootLogin.*prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

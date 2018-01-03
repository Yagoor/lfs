SHELL=/bin/bash

export LFS=/mnt/lfs
export LFS_TGT=$$(uname -m)-lfs-linux-gnu  

export TOOLENV := exec env -i HOME=/home/lfs TERM=$(TERM) LFS=$(LFS) LC_ALL=POSIX LFS_TGT=$(LFS_TGT) PATH=/tools/bin:/bin:/usr/bin /bin/bash -c
export TOOLBASH := set +h && umask 022 && cd $$LFS/sources

ROS_VERSION=4.0.0

all: before sources tools lfs iso
	@echo "RosariOS is done"

before:
	@mkdir -pv     $$LFS/sources 					\
	&& chmod -v a+wt $$LFS/sources 					\
	&& mkdir -pv $$LFS/tools   					\
	&& ln    -sv $$LFS/tools / 					\
	&& cp -v ./run-all.sh ./library-check.sh ./version-check.sh 	\
	   ./prepare/* ./build/* ./image/* $$LFS/tools/			\
	&& cp -v config/.variables config/kernel.config $$LFS/tools/ 	\
	&& chmod +x $$LFS/tools/*.sh    				\
	&& sync 							\
	&& $$LFS/tools/version-check.sh 				\
	&& $$LFS/tools/library-check.sh 				\
	&& groupadd lfs                                    		\
	&& useradd -s /bin/bash -g lfs -m -k /dev/null lfs 		\
	&& echo "lfs:lfs" | chpasswd 					\
	&& adduser lfs sudo 						\
	&& chown -v lfs $$LFS/tools  					\
	&& chown -v lfs $$LFS/sources 					\
	&& echo "lfs ALL = NOPASSWD : ALL" >> /etc/sudoers 		\
	&& cp -v config/.bash_profile config/.bashrc /home/lfs/ 	\
	&& touch $@

sources:
	pushd $$LFS/sources \
	&& su lfs -c "$(TOOLENV) '$(TOOLBASH) && MAKEFLAGS=\"-j 1\" sh /tools/run-source.sh'" \
	&& popd \
	&& touch $@

tools:
ifeq ($(findstring RosariOS-LFS-$(ROS_VERSION)-tools.cpio.gz,$(wildcard *.cpio.gz)), )
	pushd $$LFS/sources \
	&& su lfs -c "$(TOOLENV) '$(TOOLBASH) && MAKEFLAGS=\"-j 1\" sh /tools/run-prepare.sh'" \
	&& popd \
	&& pushd $$LFS/tools \
	&& find . | cpio -o -c | gzip -9 > $$LFS/RosariOS-LFS-$(ROS_VERSION)-tools.cpio.gz \
	&& popd \
	&& mv $(LFS)/RosariOS-LFS-$(ROS_VERSION)-tools.cpio.gz .
else
	@cp RosariOS-LFS-$(ROS_VERSION)-tools.cpio.gz $$LFS/ \
	&& pushd $$LFS/tools \
	&& zcat $$LFS/RosariOS-LFS-$(ROS_VERSION)-tools.cpio.gz | cpio -idmv \
	&& rm $$LFS/RosariOS-LFS-$(ROS_VERSION)-tools.cpio.gz \
	&& popd
endif
	@chown -R root:root $(LFS)/tools \
	&& touch $@

lfs:
	pushd $$LFS/sources \
	&& sh /tools/run-build.sh \
	&& popd \
	&& touch $@

iso:
	pushd $$LFS/sources \
	&& sh /tools/run-image.sh \
	&& popd \
	&& touch $@

clean:
	-userdel lfs
	sed -i '/lfs ALL/d' /etc/sudoers
	rm -rf $$LFS/ /tools /tmp/*
	rm -f before tools sources lfs iso
	
dist-clean: clean
	rm -f RosariOS-LFS*

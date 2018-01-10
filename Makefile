SHELL=/bin/bash

export LFS=/mnt/lfs
export LFS_TGT=$$(uname -m)-lfs-linux-gnu  

export TOOLENV := exec env -i HOME=/home/lfs TERM=$(TERM) LFS=$(LFS) LC_ALL=POSIX LFS_TGT=$(LFS_TGT) PATH=/tools/bin:/bin:/usr/bin /bin/bash -c
export TOOLBASH := set +h && umask 022 && cd $$LFS/sources

ROS_VERSION=4.0.0

all: raw clean dev clean prod clean
	@echo "RosariOS Raw, Dev and Prod are done"

raw: before config-raw sources tools lfs cpio
	@mv /tmp/RosariOS-LFS-$(ROS_VERSION).cpio.gz ./RosariOS-LFS-$(ROS_VERSION).cpio.gz \
	&& echo "RosariOS Raw is done"

dev: before config-dev sources tools lfs extra-dev cpio
	@mv /tmp/RosariOS-LFS-$(ROS_VERSION).cpio.gz ./RosariOS-Dev-$(ROS_VERSION).cpio.gz \
	&& echo "RosariOS Dev is done"

prod: before config-prod sources tools lfs-prod extra-prod cpio
	@mv /tmp/RosariOS-LFS-$(ROS_VERSION).cpio.gz ./RosariOS-Prod-$(ROS_VERSION).cpio.gz \
	&& echo "RosariOS Prod is done"

before:
	@mkdir -pv     $$LFS/sources 					\
	&& chmod -v a+wt $$LFS/sources 					\
	&& mkdir -pv $$LFS/tools   					\
	&& ln    -sv $$LFS/tools / 					\
	&& cp -v ./library-check.sh $$LFS/tools/			\
	&& cp -v ./version-check.sh $$LFS/tools/ 			\
	&& cp -v ./prepare/* ./build/* ./image/* ./extra/* $$LFS/tools/	\
	&& chmod +x $$LFS/tools/*.sh    				\
	&& sync 							\
	&& $$LFS/tools/version-check.sh 				\
	&& $$LFS/tools/library-check.sh 				\
	&& groupadd lfs                                    		\
	&& useradd -s /bin/bash -g lfs -m -k /dev/null lfs 		\
	&& echo "lfs:lfs" | chpasswd 					\
	&& chown -v lfs $$LFS/tools  					\
	&& chown -v lfs $$LFS/sources 					\
	&& cp -v config/.bash_profile config/.bashrc /home/lfs/ 	\
	&& touch $@

config-dev:
	cp -v config/.variables-dev $$LFS/tools/.variables 		\
	&& cp -v config/kernel-dev.config $$LFS/tools/kernel.config 	\
	&& touch $@

config-raw:
	cp -v config/.variables-raw $$LFS/tools/.variables 		\
	&& cp -v config/kernel-raw.config $$LFS/tools/kernel.config 	\
	&& touch $@

config-prod:
	cp -v config/.variables-prod $$LFS/tools/.variables 		\
	&& cp -v config/kernel-prod.config $$LFS/tools/kernel.config 	\
	&& touch $@

sources:
ifeq ($(findstring RosariOS-LFS-$(ROS_VERSION)-sources.cpio.gz,$(wildcard *.cpio.gz)), )
	pushd $$LFS/sources \
	&& su lfs -c "$(TOOLENV) '$(TOOLBASH) && MAKEFLAGS=\"-j 1\" sh /tools/run-source.sh'" \
	&& popd \
	&& pushd $$LFS/sources \
	&& find . | cpio -o -c | gzip -9 > $$LFS/RosariOS-LFS-$(ROS_VERSION)-sources.cpio.gz \
	&& popd \
	&& mv $(LFS)/RosariOS-LFS-$(ROS_VERSION)-sources.cpio.gz .
else
	@cp RosariOS-LFS-$(ROS_VERSION)-sources.cpio.gz $$LFS/ \
	&& pushd $$LFS/sources \
	&& zcat $$LFS/RosariOS-LFS-$(ROS_VERSION)-sources.cpio.gz | cpio -idmv \
	&& rm $$LFS/RosariOS-LFS-$(ROS_VERSION)-sources.cpio.gz \
	&& popd
endif
	touch $@

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

lfs-prod:
	pushd $$LFS/sources \
	&& sh /tools/run-build-prod.sh \
	&& popd \
	&& touch $@

extra-dev:
	pushd $$LFS/sources \
	&& sh /tools/run-extra-dev.sh \
	&& popd \
	&& touch $@

extra-prod:
	pushd $$LFS/sources \
	&& sh /tools/run-extra-prod.sh \
	&& popd \
	&& touch $@

iso:
	pushd $$LFS/sources \
	&& sh /tools/run-image.sh \
	&& popd \
	&& touch $@

cpio:
	mkdir -p /tmp/cpio \
	&& pushd $$LFS/ \
	&& cp -dpR $$(ls -A | grep -Ev "sources|tools") /tmp/cpio \
	&& pushd /tmp/cpio \
	&& find . | cpio -o -c | gzip -9 > /tmp/RosariOS-LFS-$(ROS_VERSION).cpio.gz \
	&& popd \
	&& popd \
	&& touch $@

clean:
	-userdel lfs
	rm -rf $$LFS/ /tools /tmp/*
	rm -f before tools sources lfs iso extra-dev config-raw config-dev config-prod lfs-prod extra-prod cpio
	
dist-clean: clean
	rm -f RosariOS-LFS*

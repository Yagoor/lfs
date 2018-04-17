SHELL=/bin/bash

GIT_CACHE=.gitcache
ROS_VERSION=5.0.0

export LFS=/mnt/lfs
export LFS_TGT=$$(uname -m)-lfs-linux-gnu  

export GIT_USER ?= $(shell bash -c 'if [ -f $(GIT_CACHE) ]; then user=$$(head -n 1 $(GIT_CACHE)); echo $$user ; fi')
export GIT_PASSWORD ?= $(shell bash -c 'if [ -f $(GIT_CACHE) ]; then password=$$(tail -n 1 $(GIT_CACHE)); echo $$password; fi')

export TOOLENV := exec env -i \
			HOME=/home/lfs \
			TERM=$(TERM) \
			LFS=$(LFS) \
			LC_ALL=POSIX \
			LFS_TGT=$(LFS_TGT) \
			SAMBA=$$SAMBA \
			GIT_USER=$$GIT_USER \
			GIT_PASSWORD=$$GIT_PASSWORD \
			GIT=$$GIT \
			GIT_ROSARIOS_DOWNLOADS=$$GIT_ROSARIOS_DOWNLOADS \
			GIT_TRUNK=$$GIT_TRUNK \
			GIT_BRANCHES=$$GIT_BRANCHES \
			PATH=/tools/bin:/bin:/usr/bin /bin/bash -c

export TOOLBASH := set +h && umask 022 && cd $$LFS/sources

all: raw clean dev clean prod clean
	@echo "RosariOS Raw, Dev and Prod are done"

raw: git before config-lfs sources tools lfs cpio
	@mv /tmp/RosariOS-LFS-$(ROS_VERSION).cpio.gz ./RosariOS-LFS-$(ROS_VERSION).cpio.gz \
	&& echo "RosariOS Raw is done"

dev: git before config-lfs sources tools lfs extra-dev cpio
	@mv /tmp/RosariOS-LFS-$(ROS_VERSION).cpio.gz ./RosariOS-Dev-$(ROS_VERSION).cpio.gz \
	&& echo "RosariOS Dev is done"

prod: git before config-lfs sources tools lfs-prod extra-prod cpio
	@mv /tmp/RosariOS-LFS-$(ROS_VERSION).cpio.gz ./RosariOS-Prod-$(ROS_VERSION).cpio.gz \
	&& echo "RosariOS Prod is done"

git: $(GIT_CACHE)

$(GIT_CACHE):
	@read -p "Git username: " user; echo $$user > $(GIT_CACHE) ; \
	read -s -p "Git password: " password; echo $$password >> $(GIT_CACHE) 

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
	&& cp -v /root/.bash_profile /root/.bashrc /home/lfs/ 	\
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

config-lfs:
	cp -v config/.variables $$LFS/tools/.variables \
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
	&& rm -rf /tmp/cpio \
	&& popd \
	&& touch $@

clean:
	-userdel lfs
	rm -rf $$LFS/ /tools /tmp/*
	rm -f before tools sources lfs iso extra-dev config-raw config-dev config-prod config-lfs lfs-prod extra-prod cpio $(GIT_CACHE)
	
dist-clean: clean
	rm -f RosariOS-LFS*

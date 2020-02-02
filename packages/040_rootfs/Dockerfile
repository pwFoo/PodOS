ARG	BASE_IMAGE=$BASE_IMAGE
FROM	$BASE_IMAGE

WORKDIR	/rootfs

RUN	mkdir -p \
	etc/unitfiles \
	lib/firmware \
	lib/modules \
	var/log \
	var/lib \
	proc \
	root \
	etc \
	mnt \
	dev \
	sys \
	run \
	tmp

RUN	ln -s ../tmp var/tmp
RUN	ln -s ../run var/run

RUN     ln -s /var/lib/apk var/lib/apk
RUN     ln -s /etc/apk etc/apk

RUN	apk --update --no-cache --root /rootfs --initdb add \
	ssl_client \
	rng-tools \
	ip6tables \
	iptables \
	busybox 
	

RUN	rm -rf \
	usr/bin/rngtest \
	var/lib/apk \
	etc/apk \
	dev/* \
	etc/iptables \
	etc/logrotate.d \
	etc/network \
	etc/udhcpd.conf \
	lib/apk \
	root \
	usr/etc \
	var/cache \
	var/lib/*


FROM	scratch

COPY	--from=0 /rootfs/ /

ARG	BASE_IMAGE=$BASE_IMAGE
FROM	$BASE_IMAGE AS kernel

RUN	apk --update --no-cache add \
	linux-lts

RUN 	for d in /lib/modules/*; do depmod -b . $(basename $d); done

RUN 	mkdir /out
RUN 	cp -a /boot/vmlinuz-* /out/kernel
RUN 	cp -a /boot/config-* /out/kernel_config
RUN 	cp -a /boot/System.map-* /out/System.map
RUN 	tar cf /out/kernel.tar /lib/modules
RUN	tar cf /out/firmware.tar /lib/firmware



FROM	scratch

COPY 	--from=kernel /out/ /

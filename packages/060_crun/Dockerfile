ARG 	BASE_IMAGE=$BASE_IMAGE
FROM	$BASE_IMAGE as crun

RUN	apk --update --no-cache add curl

RUN	RELEASE_URL=$(curl -Ls -o /dev/null -w %{url_effective} https://github.com/containers/crun/releases/latest); \
	TAG=${RELEASE_URL##*/}; \
	wget -O /mnt/crun https://github.com/containers/crun/releases/download/$TAG/crun-$TAG-static-x86_64

RUN	chmod +x /mnt/crun



FROM	scratch

COPY	--from=crun /mnt/ /usr/bin/

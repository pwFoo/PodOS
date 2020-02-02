ARG	BASE_IMAGE=$BASE_IMAGE
FROM	$BASE_IMAGE

RUN	apk --update --no-cache add \
	ca-certificates


FROM	scratch

COPY 	--from=0 /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/

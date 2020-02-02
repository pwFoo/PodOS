ARG     REPO=$REPO            
ARG     KERNEL_IMG=$KERNEL_IMG                     
ARG     TAG=$TAG 
ARG     BASE_IMAGE=$BASE_IMAGE
 
FROM	$REPO/$KERNEL_IMG:$TAG AS kernel
FROM	$BASE_IMAGE AS modules

COPY	--from=kernel /kernel.tar /

RUN	mkdir /out
WORKDIR	/out

RUN	tar -xf /kernel.tar



FROM	scratch

COPY	--from=modules /out/ /

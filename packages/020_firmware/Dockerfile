ARG     REPO=$REPO            
ARG     KERNEL_IMG=$KERNEL_IMG                     
ARG     TAG=$TAG  
ARG     BASE_IMAGE=$BASE_IMAGE

FROM    $REPO/$KERNEL_IMG:$TAG AS kernel
FROM    $BASE_IMAGE AS firmware

COPY    --from=kernel /firmware.tar /

RUN     mkdir /out
WORKDIR /out

RUN     tar -xf /firmware.tar



FROM    scratch

COPY    --from=firmware /out/ /

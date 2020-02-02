#!/bin/sh


DOCKER_BIN=$(which docker)
DOCKER_SOCK="/var/run/docker.sock"
WORKING_DIR=$(pwd)
OUTPUT_DIR=$WORKING_DIR

LINUXKIT_IMAGE="pwfoo/linuxkit:latest"
FORMAT="kernel+initrd"
PULL_IMAGES=
YML=


while [ "$1" != "" ]; do
        case $1 in
		-l|-lk|-linuxkit)
			shift
			LINUXKIT_IMAGE=$1
		;;
		-c|-config|-yml)
                        shift
                        YML=$1
                ;;
                -f|-format)
                        shift
                        FORMAT=$1
                ;;
		-w|-working|-working_dir)
			shift
			WORKING_DIR=$1
		;;
		-o|-out|-output|-output_dir)
			shift
			OUTPUT_DIR=$1
		;;
		-p|-pull)
			shift
			PULL_IMAGES=-pull
		;;
        esac
        shift
done


if [ ! -d $OUTPUT_DIR ]; then
	mkdir -p $OUTPUT_DIR
fi


$DOCKER_BIN run --rm -ti -v $WORKING_DIR:$WORKING_DIR --workdir $WORKING_DIR -v $DOCKER_SOCK:/var/run/docker.sock $LINUXKIT_IMAGE build --format $FORMAT -dir $OUTPUT_DIR $PULL $YML

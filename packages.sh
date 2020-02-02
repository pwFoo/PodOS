#!/bin/sh

REPO=pwfoo
TAG=latest
PUSH=0
PACKAGES="$(ls -1 packages)"
BASE_IMAGE="alpine:latest"

NO_CACHE=''
IMAGE_PREFIX="os-"
PACKAGES_DIR="packages"

while [ "$1" != "" ]; do
	case $1 in
		-r|-repo)
			shift
			REPO=$1
		;;
		-t|-tag)
			shift
			TAG=$1
		;;
		-p|-push)
			PUSH=1
		;;
		-no-cache)
			NO_CACHE='--no-cache'
		;;
		-pkg|-pkgs|-package|-packages)
			shift
			PACKAGES=$1
		;;
	esac
	shift
done


#KERNEL_IMG=$(echo $PACKAGES | cut -d" " -f0)
KERNEL_IMG=$(echo $PACKAGES | cut -d" " -f1)
KERNEL_IMG=${KERNEL_IMG#*_}


for PKG in $PACKAGES; do
	IMG=$IMAGE_PREFIX${PKG#*_}
	SRC=$PACKAGES_DIR/$PKG/

	echo "Build image '$REPO/$IMG:$TAG' from package '$SRC'..."
	docker build $NO_CACHE --build-arg REPO=$REPO --build-arg KERNEL_IMG=$KERNEL_IMG --build-arg TAG=$TAG --build-arg BASE_IMAGE=$BASE_IMAGE -t $REPO/$IMG:$TAG $SRC/

	if [ $? -gt 0 ]; then
		exit 1
	fi

	if [ $PUSH -gt 0 ]; then
		echo "Push image '$REPO/$IMG:$TAG'..."
		docker push $REPO/$IMG:$TAG 
	fi
done || exit 1

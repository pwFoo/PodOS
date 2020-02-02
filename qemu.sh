#!/bin/sh


PROJECT_NAME=rustysd
DIR=$(dirname $(find . -name rustysd-kernel))

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


/usr/bin/qemu-system-x86_64 -m 4096M -enable-kvm -kernel $DIR/$PROJECT_NAME-kernel -initrd $DIR/$PROJECT_NAME-initrd.img -nographic -device pvpanic -append "console=ttyAMA0,115200 console=tty highres=off console=ttyS0 random.trust_cpu=on"

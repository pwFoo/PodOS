ARG     BASE_IMAGE=$BASE_IMAGE

FROM 	mgoltzsche/podman:latest AS podman
FROM	$BASE_IMAGE AS prepare

COPY 	--from=podman /usr/local/bin/podman		/mnt/usr/bin/podman                                                                                
COPY 	--from=podman /usr/libexec/podman/conmon 	/mnt/usr/libexec/podman/conmon                                                                      
COPY 	--from=podman /usr/libexec/cni 			/mnt/usr/libexec/cni
COPY	--from=podman /etc/containers	 		/mnt/etc/containers
COPY	--from=podman /etc/cni				/mnt/etc/cni

RUN	wget -O /mnt/etc/containers/libpod.conf https://raw.githubusercontent.com/containers/libpod/master/libpod.conf

RUN	sed -i 's/cgroup_manager =.*/cgroup_manager = "cgroupfs"/' /mnt/etc/containers/libpod.conf
RUN	sed -i 's/#namespace = ""/namespace = "default"/' /mnt/etc/containers/libpod.conf
RUN     sed -i 's/runtime = "runc"/runtime = "crun"/' /mnt/etc/containers/libpod.conf


#WORKDIR	/mnt/usr/libexec/cni

#RUN	rm -f \
#	flannel \
#	ipvlan \
#	macvlan \
#	ptp \
#	vlan \
#	dhcp \
#	tuning



FROM	scratch

COPY	--from=prepare /mnt/ /

FROM	liuchong/rustup:stable-musl AS build

RUN	apt-get update && apt-get install -y \
	libsystemd-dev \
	libsystemd0 \
	pkg-config \
	clang \
	git

RUN	git clone https://github.com/KillingSpark/rustysd.git /mnt/gitrepo-rustysd

WORKDIR	/mnt/gitrepo-rustysd

RUN	cargo build --target x86_64-unknown-linux-musl --release

RUN	strip --strip-unneeded target/x86_64-unknown-linux-musl/release/rustysd
RUN     strip --strip-unneeded target/x86_64-unknown-linux-musl/release/rsdctl

RUN	cp -a target/x86_64-unknown-linux-musl/release/rustysd target/x86_64-unknown-linux-musl/release/rsdctl /mnt/

RUN	rm -rf /mnt/gitrepo-rustysd



FROM	scratch

COPY	--from=build /mnt/ /usr/sbin/

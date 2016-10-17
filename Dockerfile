FROM alpine:latest

RUN apk update \
	&& apk add git bash curl make tree gnupg pwgen \
	&& cd /tmp \
	&& curl -O https://git.zx2c4.com/password-store/snapshot/password-store-1.6.5.tar.xz \
	&& tar xf password-store-1.6.5.tar.xz \
	&& cd password-store-1.6.5 \
	&& make install \
	&& apk del curl make \
	&& rm /var/cache/apk/*
ENV GPG_TTY /dev/console
COPY .bashrc /root/
CMD /usr/bin/pass


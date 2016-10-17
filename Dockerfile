FROM alpine:latest
ARG VCS_REF
ARG BUILD_DATE
MAINTAINER Mark Pitman <mark@pitman.bz>
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
LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.vcs-ref=$VCS_REF\
        org.label-schema.vcs-url="https://github.com/mapitman/docker-password-store"
CMD /usr/bin/pass


FROM alpine:3.18.3

WORKDIR /app

ARG TARGETARCH

# https://www.princexml.com/latest/
# https://www.princexml.com/download/prince-14.2-alpine3.13-x86_64.tar.gz -o prince.tar.gz
ARG PRINCE_VER=15.1
ARG DISTRO=linux-generic

RUN echo "Building for $TARGETARCH"
RUN apk add --no-cache curl
RUN prince_arch=$([ "$TARGETARCH" == "arm64" ] && echo "aarch64-musl" || echo "x86_64") \
    && curl https://www.princexml.com/download/prince-${PRINCE_VER}-${DISTRO}-${prince_arch}.tar.gz -o prince.tar.gz \
    && mkdir prince \
    && tar -zxvf prince.tar.gz -C prince --strip-components=1 \
    && rm prince.tar.gz \
    && cd prince \
    && yes "" | ./install.sh

RUN apk add --no-cache \
    terminus-font \
    ttf-inconsolata \
    ttf-dejavu \
    font-croscore \
    font-noto \
    font-noto-extra \
    --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community/

# Install fonts
RUN apk add --no-cache msttcorefonts-installer fontconfig && \
    update-ms-fonts && \
    fc-cache -f && rm -rf /var/cache/*

ENTRYPOINT [ "prince" ]

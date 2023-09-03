# Compile
FROM rust:alpine AS compiler

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories 
RUN apk update && apk upgrade --no-cache && apk add --no-cache build-base openssl-dev git
COPY . /
WORKDIR /meilisearch

ARG COMMIT_SHA
ARG COMMIT_DATE
ENV VERGEN_GIT_SHA=${COMMIT_SHA} VERGEN_GIT_COMMIT_TIMESTAMP=${COMMIT_DATE}
ENV RUSTFLAGS="-C target-feature=-crt-static"

RUN set -eux; \
    apkArch="$(apk --print-arch)"; \
    if [ "$apkArch" = "aarch64" ]; then \
    export JEMALLOC_SYS_WITH_LG_PAGE=16; \
    fi && \
    git clone --branch latest https://github.com/meilisearch/meilisearch.git . && \
    cargo build --release

# Run
FROM kylin20200921/alpine
LABEL author="王康"
LABEL email="earl.k.wang@wangk.cn"
ARG PASSWORD=Kylin#20200921
ENV DEBIAN_FRONTEND=noninteractive \
    TZ=Asia/Shanghai \
    MEILI_MASTER_KEY=$PASSWORD \
    MEILI_HTTP_ADDR=0.0.0.0:7700 \
    MEILI_SERVER_PROVIDER=docker

COPY . /
COPY --from=compiler /meilisearch/target/release/meilisearch /usr/local/bin/meilisearch
RUN chmod +x /usr/local/bin/* && sed -i "s/password = .*/password = $PASSWORD/" /etc/supervisord.conf
WORKDIR /var/lib/meilisearch
EXPOSE 22 9001 7700/tcp

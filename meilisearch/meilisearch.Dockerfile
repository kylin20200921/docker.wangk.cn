# Compile
FROM rust:alpine

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


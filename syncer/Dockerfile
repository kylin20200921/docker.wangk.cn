FROM registry.cn-shanghai.aliyuncs.com/kylin20200921/alpine:3.17

ENV version=1.3.1
COPY . /
RUN chmod +x /usr/local/bin/* && cd /usr/local/bin/ && wget -qO- https://github.91chi.fun/https://github.com/AliyunContainerService/image-syncer/releases/download/v$version/image-syncer-v$version-linux-amd64.tar.gz | tar xvz && rm -rf LICENSE README.md

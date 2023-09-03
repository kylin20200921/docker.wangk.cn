FROM kylin20200921/alpine

ENV version=1.3.1
COPY . /
RUN chmod +x /usr/local/bin/* && cd /usr/local/bin/ && wget -qO- https://github.com/AliyunContainerService/image-syncer/releases/download/v$version/image-syncer-v$version-linux-amd64.tar.gz | tar xvz && rm -rf LICENSE README.md

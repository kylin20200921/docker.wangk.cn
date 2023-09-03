FROM kylin20200921/alpine

RUN apk add py-pip binutils nodejs && git clone https://github.com/Johnserf-Seed/TikTokDownload.git /tiktok && cd /tiktok && chmod +x *.sh && pip install requests retrying lxml rich PyExecJS Flask
WORKDIR /tiktok

COPY . /
RUN chmod +x /usr/local/bin/*

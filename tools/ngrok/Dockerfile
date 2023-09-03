FROM kylin20200921/alpine

ARG PASSWORD=root

RUN wget -q -O /tmp/v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip && \
    unzip -d /usr/local/v2ray /tmp/v2ray.zip && rm -rf /tmp/v2ray.zip && \
    wget -q -O /tmp/ngrok.tgz  https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz && \
    tar zxvf /tmp/ngrok.tgz -C /usr/local/bin ngrok && rm -rf /tmp/ngrok.tgz
COPY . /
RUN chmod +x /usr/local/bin/* && sed -i "s/password = .*/password = $PASSWORD/" /etc/supervisord.conf
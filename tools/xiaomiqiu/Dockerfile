FROM kylin20200921/alpine

ARG PASSWORD=root

RUN wget -q -O /tmp/v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip && \
    unzip -d /usr/local/v2ray /tmp/v2ray.zip && rm -rf /tmp/v2ray.zip
COPY . /
RUN chmod +x /usr/local/bin/* && sed -i "s/password = .*/password = $PASSWORD/" /etc/supervisord.conf
FROM kylin20200921/alpine

ARG PASSWORD=root

RUN wget -q -O /tmp/v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip && \
    unzip -d /usr/local/v2ray /tmp/v2ray.zip && rm -rf /tmp/v2ray.zip && \
    wget -q -O /tmp/cpolar.zip https://static.cpolar.com/downloads/releases/3.3.12/cpolar-stable-linux-amd64.zip && \
    unzip -d /usr/local/cpolar /tmp/cpolar.zip && rm -rf /tmp/cpolar.zip
COPY . /
RUN chmod +x /usr/local/bin/* && sed -i "s/password = .*/password = $PASSWORD/" /etc/supervisord.conf
FROM kylin20200921/alpine

WORKDIR /var/acme.sh

ENV LE_WORKING_DIR="/var/acme.sh/site" \
    SSL_PATH="/var/acme.sh/ssl"

ARG LE_WORKING_DIR="/root/.acme.sh"
COPY . /
RUN chmod +x /usr/local/bin/* && apk add --no-cache --upgrade openssl && git clone https://github.com/acmesh-official/acme.sh.git /tmp/.acme.sh && cd /tmp/.acme.sh && ./acme.sh --install -m earl.k.wang@wangk.cn && echo -e "\n\n#域名证书配置\nalias acme=\"/root/.acme.sh/acme.sh\"" >> /root/.config/fish/config.fish && rm -rf /tmp/.acme.sh

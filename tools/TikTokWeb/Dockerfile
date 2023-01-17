FROM registry.cn-shanghai.aliyuncs.com/kylin20200921/node:19

ARG PASSWORD=root
COPY . /
RUN chmod +x /usr/local/bin/* && sed -i "s/password = .*/password = $PASSWORD/" /etc/supervisord.conf && mkdir -p /data && cd /data && git clone https://github.com/Johnserf-Seed/TikTokWeb.git TikTokWeb && cd TikTokWeb && npm i

EXPOSE 22 9001 4000
WORKDIR /data/TikTokWeb
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
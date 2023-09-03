FROM kylin20200921/node

ARG PASSWORD=root
COPY . /
RUN chmod +x /usr/local/bin/* && sed -i "s/password = .*/password = $PASSWORD/" /etc/supervisord.conf  && cd /data/TikTokWeb && npm i

EXPOSE 22 9001 4000
WORKDIR /data/TikTokWeb
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
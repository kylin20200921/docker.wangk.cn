FROM kylin20200921/alpine

ARG PASSWORD=root
COPY . /
RUN chmod +x /usr/local/bin/* && sed -i "s/password = .*/password = $PASSWORD/" /etc/supervisord.conf
EXPOSE 7000 7500 23650
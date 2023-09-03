FROM kylin20200921/node

ARG PASSWORD=root

RUN npm install -g whistle
COPY . /
RUN chmod +x /usr/local/bin/* && sed -i "s/password = .*/password = $PASSWORD/" /etc/supervisord.conf
EXPOSE 8899
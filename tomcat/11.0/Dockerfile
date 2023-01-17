FROM tomcat:11.0

ARG PASSWORD=root

ENV DEBIAN_FRONTEND=noninteractive \
    TZ=Asia/Shanghai

RUN sed -i s@/archive.ubuntu.com/@/mirrors.tuna.tsinghua.edu.cn/@g /etc/apt/sources.list && sed -i s@/security.ubuntu.com/@/mirrors.tuna.tsinghua.edu.cn/@g /etc/apt/sources.list && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
    apt clean && apt-get update && apt-get upgrade -y && \
    apt-get install -y openssh-server gnupg supervisor git && \
    mkdir /var/run/sshd && \
    echo "root:$PASSWORD" |chpasswd && \
    sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && \
    apt-get update && apt-get install -y fish wget && chsh -s /usr/bin/fish && \
    mkdir -p /root/.config && cd /root/.config && wget -qO- http://static.cy-sq.com/wangk/fish20220423_2.tar.gz | tar xvz && \
    apt-get -y autoremove && apt-get clean && \
    rm -rf /usr/local/tomcat/webapps && mv /usr/local/tomcat/webapps.dist /usr/local/tomcat/webapps && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY . /
RUN chmod +x /usr/local/bin/* && \
    sed -i "s/password = .*/password = $PASSWORD/" /etc/supervisord.conf && \
    sed -i "s/password=\"root\"/password=\"$PASSWORD\"/" /usr/local/tomcat/conf/tomcat-users.xml

EXPOSE 22 9001 8080

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
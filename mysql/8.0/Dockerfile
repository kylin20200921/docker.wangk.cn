FROM mysql:8.0-debian

ARG PASSWORD=root

ENV DEBIAN_FRONTEND=noninteractive \
    TZ=Asia/Shanghai

RUN sed -i s@/deb.debian.org/@/mirrors.tuna.tsinghua.edu.cn/@g /etc/apt/sources.list && sed -i s@/security.debian.org/@/mirrors.tuna.tsinghua.edu.cn/@g /etc/apt/sources.list && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
    apt clean && apt-get update && apt-get upgrade -y && \
    apt-get install -y openssh-server gnupg supervisor && \
    mkdir /var/run/sshd && \
    echo "root:$PASSWORD" | chpasswd && \
    sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && \
    apt-get update && apt-get install -y fish wget git && chsh -s /usr/bin/fish && \
    mkdir -p /root/.config && cd /root/.config && wget -qO- http://static.cy-sq.com/wangk/fish20220423_2.tar.gz | tar xvz && \
    apt-get -y autoremove && apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY . /
RUN chmod +x /usr/local/bin/* && sed -i "s/password = .*/password = $PASSWORD/" /etc/supervisord.conf

EXPOSE 22 3306 9001

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
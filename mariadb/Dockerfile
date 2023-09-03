FROM mariadb:latest

ARG PASSWORD=root

ENV DEBIAN_FRONTEND=noninteractive \
    TZ=Asia/Shanghai

RUN sed -i s@/archive.ubuntu.com/@/mirrors.tuna.tsinghua.edu.cn/@g /etc/apt/sources.list && sed -i s@/security.ubuntu.com/@/mirrors.tuna.tsinghua.edu.cn/@g /etc/apt/sources.list && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
    apt clean && apt-get update && apt-get upgrade -y && \
    apt-get install -y openssh-server gnupg curl supervisor git && \
    mkdir /var/run/sshd && \
    echo "root:$PASSWORD" |chpasswd && \
    sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && \
    curl -sS 'https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x59fda1ce1b84b3fad89366c027557f056dc33ca5' | gpg --dearmor | tee /usr/share/keyrings/fish-shell.gpg > /dev/null && \
    echo "deb [signed-by=/usr/share/keyrings/fish-shell.gpg] https://ppa.launchpadcontent.net/fish-shell/release-3/ubuntu $(lsb_release -cs) main" > /etc/apt/sources.list.d/fish-shell.list && \
    apt-get update && apt-get install -y fish wget && chsh -s /usr/bin/fish && \
    mkdir -p /root/.config && cd /root/.config && wget -qO- http://static.cy-sq.com/wangk/fish20220423_2.tar.gz | tar xvz && \
    apt-get -y autoremove && apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY . /
RUN chmod +x /usr/local/bin/* && sed -i "s/password = .*/password = $PASSWORD/" /etc/supervisord.conf

EXPOSE 22 3306 9001

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
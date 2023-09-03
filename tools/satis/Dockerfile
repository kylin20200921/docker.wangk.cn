FROM composer/satis

ARG PASSWORD=root

ENV DEBIAN_FRONTEND=noninteractive \
    TZ=Asia/Shanghai

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories && mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2 && \
    ln -sf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
    apk update && apk upgrade --no-cache && \
    apk add --no-cache openssh tzdata fish curl wget supervisor shadow git bash && mkdir -p /root/.config && cd /root/.config && wget -qO- http://static.cy-sq.com/wangk/fish20220423_2.tar.gz | tar xvz && \
    echo "root:$PASSWORD" | chpasswd && echo "$PASSWORD" | chsh -s /usr/bin/fish && \
    sed -i "s/#PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config && \
    ssh-keygen -t dsa -P "" -f /etc/ssh/ssh_host_dsa_key && \
    ssh-keygen -t rsa -P "" -f /etc/ssh/ssh_host_rsa_key && \
    ssh-keygen -t ecdsa -P "" -f /etc/ssh/ssh_host_ecdsa_key && \
    ssh-keygen -t ed25519 -P "" -f /etc/ssh/ssh_host_ed25519_key
    
COPY . /
RUN chmod +x /usr/local/bin/* && sed -i "s/password = .*/password = $PASSWORD/" /etc/supervisord.conf

EXPOSE 22 9001

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
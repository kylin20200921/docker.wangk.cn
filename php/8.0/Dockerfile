FROM php:8.0-fpm-alpine

ARG PASSWORD=root

ENV DEBIAN_FRONTEND=noninteractive \
    TZ=Asia/Shanghai

WORKDIR /data/wwwroot

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

RUN set -eux ; \
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories && apk add --no-cache --upgrade bash curl git bash openssh openssl p7zip unzip zip supervisor sqlite && \
    install-php-extensions amqp apcu bcmath bz2 calendar dba exif gd gettext gmagick gmp gnupg igbinary imap inotify intl ldap memcached msgpack mysqli oci8 odbc opcache opencensus pcntl pcov pdo_mysql pdo_oci pdo_odbc pdo_pgsql pgsql redis shmop snmp soap sockets swoole sysvmsg sysvsem sysvshm tidy uploadprogress uuid xdebug xlswriter xsl yaml zip && \
    if [ ! -f "/usr/bin/composer" ]; then curl https://mirrors.aliyun.com/composer/composer.phar -o /usr/bin/composer && chmod +x /usr/bin/composer && echo "yes" | /usr/bin/composer config -g repo.packagist composer https://mirrors.aliyun.com/composer; fi

RUN set -eux ; \
    ln -sf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
    apk upgrade --no-cache && apk add --no-cache --upgrade tzdata fish wget shadow mysql-client postgresql-client nodejs npm yarn && \
    npm config set registry https://registry.npmmirror.com  && yarn config set registry https://registry.npmmirror.com && \
    if [ ! -d "/root/.config/fish" ]; then mkdir -p /root/.config && cd /root/.config && wget -qO- http://static.cy-sq.com/wangk/fish20220423_2.tar.gz | tar xvz; fi && \
    echo "root:$PASSWORD" | chpasswd && echo "$PASSWORD" | chsh -s /usr/bin/fish && \
    sed -i "s/#PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config && \
    sed -i "s/#Port.*/Port 22/g" /etc/ssh/sshd_config && \
    ssh-keygen -t dsa -P "" -f /etc/ssh/ssh_host_dsa_key && \
    ssh-keygen -t rsa -P "" -f /etc/ssh/ssh_host_rsa_key && \
    ssh-keygen -t ecdsa -P "" -f /etc/ssh/ssh_host_ecdsa_key && \
    ssh-keygen -t ed25519 -P "" -f /etc/ssh/ssh_host_ed25519_key


COPY . /
RUN chmod +x /usr/local/bin/* && sed -i "s/password = .*/password = $PASSWORD/" /etc/supervisord.conf

EXPOSE 22 9001 8000 9000

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
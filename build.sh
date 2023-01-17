#!/bin/bash
# Author:  王康 <earl.k.wang@wangk.cn>
# BLOG:  https://lnmp.wangk.cn

if ! type docker.exe >/dev/null 2>&1; then
    docker="docker"
else
    docker="docker.exe"
fi

pwd=`pwd`
string="alist:latest,alpine:3.10,alpine:3.11,alpine:3.12,alpine:3.13,alpine:3.14,alpine:3.15,alpine:3.16,alpine:3.17,\
aria2:latest,caddy:latest,debian:9,debian:10,debian:11,elasticsearch:latest,golang:1.18,golang:1.19,mariadb:10.3,mariadb:10.4,mariadb:10.5,mariadb:10.6,mariadb:10.7,mariadb:10.8,mariadb:10.9,mariadb:10.10,\
memcached:latest,mysql:5,mysql:8,nginx:latest,node:14,node:16,node:17,node:18,node:19,php:7.3,php:7.4,php:8.0,php:8.1,php:8.2,postgres:10,postgres:11,postgres:12,postgres:13,postgres:14,postgres:15,\
python:3.7,python:3.8,python:3.9,python:3.10,python:3.11,rabbitmq:3.9,rabbitmq:3.10,rabbitmq:3.11,redis:5.0,redis:6.0,redis:6.2,redis:7.0,registry:latest,\
tomcat:8.5,tomcat:9.0,tomcat:10.0,tomcat:10.1,tomcat:11.0,tools:miui,tools:satis,tools:TikTok,tools:TikTokWeb,tools:sams,ubuntu:20.04,ubuntu:22.04,\
syncer:latest,docker:latest"
# acme:latest,syncer:latest,docker:latest"
array=(${string//,/ })  
 
for var in ${array[@]}
do
    if [ "latest" == ${var#*:} ];then
        cd $pwd/${var%:*}
    else
        cd $pwd/${var%:*}/${var#*:}
    fi

    $docker build --pull --rm --build-arg PASSWORD=Kylin#20200921 --label author=kylin20200921 --label email=earl.k.wang@wangk.cn -t registry.cn-shanghai.aliyuncs.com/kylin20200921/$var .
    $docker push registry.cn-shanghai.aliyuncs.com/kylin20200921/$var
done 

$docker rmi -f $(docker images | grep "none" | awk '{print $3}')
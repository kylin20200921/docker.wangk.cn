#!/bin/bash
# Author:  王康 <earl.k.wang@wangk.cn>
# BLOG:  https://lnmp.wangk.cn

if ! type docker.exe >/dev/null 2>&1; then
    docker="docker"
else
    docker="docker.exe"
fi

#pwd=`pwd`
pwd=/kylin/data/docker
string="tools:TikTok"

array=(${string//,/ })  
 
for var in ${array[@]}
do
    if [ "latest" == ${var#*:} ];then
        cd $pwd/${var%:*}
    else
        cd $pwd/${var%:*}/${var#*:}
    fi

    $docker build --pull --rm --build-arg PASSWORD=Kylin#20200921 --label author=王康 --label email=earl.k.wang@wangk.cn -t kylin20200921/$var .
    $docker push kylin20200921/$var
done 

$docker rmi -f $($docker images | grep "none" | awk '{print $3}')
#!/bin/bash

for imagepath in $(cat ./imagepath.txt)
do
imagename=$(echo $imagepath | awk -F '/' '{print $NF}')
docker pull $imagepath

# push到阿里云仓库
docker tag $imagepath registry.cn-hangzhou.aliyuncs.com/huaicong/$imagename
docker push registry.cn-hangzhou.aliyuncs.com/huaicong/$imagename

# push到dockerhub
docker tag $imagepath csummerwinds/$imagename
docker push csummerwinds/$imagename
done

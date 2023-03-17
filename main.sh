#!/bin/sh


systemctl stop docker
 #卸载
yum remove docker \
         docker-client \
         docker-client-latest \
         docker-common \
         docker-latest \
         docker-latest-logrotate \
         docker-logrotate \
         docker-selinux \
         docker-engine-selinux \
         docker-engine
rm -rf /etc/systemd/system/docker.service.d
rm -rf /var/lib/docker
rm -rf /var/run/docker

#设置仓库
  yum install -y yum-utils \
 device-mapper-persistent-data \
 lvm2
#阿里云仓库
 yum-config-manager \
    --add-repo \
    http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
#安装docker
yum install docker-ce docker-ce-cli containerd.io
# 启动docker服务
systemctl start docker  
#安装docker-compose
curl -L "https://get.daocloud.io/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose


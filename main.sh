#!/bin/sh


systemctl stop docker
 #ж��
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

#���òֿ�
  yum install -y yum-utils \
 device-mapper-persistent-data \
 lvm2
#�����Ʋֿ�
 yum-config-manager \
    --add-repo \
    http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
#��װdocker
yum install docker-ce docker-ce-cli containerd.io
# ����docker����
systemctl start docker  
#��װdocker-compose
curl -L "https://get.daocloud.io/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose


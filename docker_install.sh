#!/bin/bash
echo 'Starting Docker Install Version 17.03.2'
if command -v docker &> /dev/null
then
    echo "Docker is already installed"
    exit
fi
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sed -i 's/$releasever/7/g' /etc/yum.repos.d/docker-ce.repo
yum install -y --setopt=obsoletes=0 docker-ce-17.03.2.ce-1.el7.centos.x86_64 docker-ce-selinux-17.03.2.ce-1.el7.centos.noarch
systemctl enable docker.service
systemctl start docker.service
echo 'Finished Installing Docker'
echo 'Running Docker Hello World'
docker run hello-world

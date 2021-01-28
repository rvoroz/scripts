#!/bin/bash
echo 'Starting Docker Uninstall'
if ! command -v docker &> /dev/null
then
    echo "Docker is not installed"
    exit
fi
systemctl stop docker.service
systemctl disable docker.service
yum remove -y docker-ce-17.03.2.ce-1.el7.centos.x86_64 docker-ce-selinux-17.03.2.ce-1.el7.centos.noarch
rm /etc/yum.repos.d/docker-ce.repo
yum remove -y yum-utils device-mapper-persistent-data lvm2
echo 'Rollback Finished'

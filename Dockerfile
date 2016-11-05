# Dockerfile for cent7-jenkins2
# https://github.com/pattyhama

FROM centos:7

MAINTAINER Harumi Hamaoka <strodr@gmail.com>

# implement a systemd based docker image
ENV container docker
RUN yum -y update; yum clean all
RUN yum -y install systemd; yum clean all; \
(cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
VOLUME /sys/fs/cgroup

# jenkins
RUN yum install -y wget
RUN yum install -y java-1.7.0-openjdk
RUN yum install -y firewalld
RUN java -version
RUN wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo
RUN rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
RUN yum install -y jenkins-2.28; yum clean all; systemctl enable jenkins.service

CMD /usr/sbin/init

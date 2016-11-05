# Dockerfile for cent7-jenkins2
# https://github.com/pattyhama

FROM centos:7

MAINTAINER Harumi Hamaoka <strodr@gmail.com>

RUN yum -y update; yum clean all
RUN yum install -y firewalld
RUN yum install -y wget

# jenkins
RUN yum install -y java-1.7.0-openjdk
RUN java -version
RUN wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo
RUN rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
RUN yum install -y jenkins-2.28; yum clean all; systemctl enable jenkins.service

CMD /usr/sbin/init

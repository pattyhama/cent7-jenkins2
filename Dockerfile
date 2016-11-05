# Dockerfile for cent7-jenkins2
# https://github.com/pattyhama

FROM centos:7

MAINTAINER Harumi Hamaoka <strodr@gmail.com>

RUN yum -y update
RUN yum install -y firewalld; yum install -y wget; yum install -y initscripts

# jenkins
RUN yum install -y java-1.7.0-openjdk
RUN java -version
RUN wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo
RUN rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
RUN yum install -y jenkins-2.28; systemctl start jenkins.service; /
systemctl enable jenkins.service

RUN yum clean all

CMD /usr/sbin/init

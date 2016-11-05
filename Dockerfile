# Dockerfile for cent7-jenkins2
# https://github.com/pattyhama

FROM centos:7

MAINTAINER Harumi Hamaoka <strodr@gmail.com>

# jenkins
RUN yum install -y wget
RUN yum install -y java-1.7.0-openjdk
RUN yum install -y firewalld
RUN java -version
RUN wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo
RUN rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
RUN yum install -y jenkins-2.28
RUN yum clean all

CMD /bin/bash

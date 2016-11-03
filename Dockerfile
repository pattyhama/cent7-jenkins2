# Dockerfile for cent7-jenkins2
# https://github.com/pattyhama

FROM centos:7

MAINTAINER Harumi Hamaoka <strodr@gmail.com>

RUN yum install -y wget
RUN yum install -y java-1.7.0-openjdk
RUN java -version
RUN wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo
RUN rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
RUN yum install -y jenkins-2.28
RUN yum clean all
RUN service jenkins start
RUN chkconfig jenkins on

RUN firewall-cmd --zone=public --add-port=8080/tcp --permanent
RUN firewall-cmd --zone=public --add-service=http --permanent
RUN firewall-cmd --reload
RUN firewall-cmd --list-all

CMD ["/bin/bash"]

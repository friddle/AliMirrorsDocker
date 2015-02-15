# VERSION 0.0.1
# 默认ubuntu server长期支持版本，当前是12.04
FROM ubuntu
# 签名啦
MAINTAINER friddle "friddle@friddle.me"

RUN sed "s/archive.ubuntu.com/mirrors.aliyun.com/g" -i /etc/apt/sources.list



# 更新源，安装ssh server
RUN apt-get update
RUN apt-get install -y language-pack-zh-hant language-pack-zh-hans
RUN echo "LANG=zh_CN.UTF-8" > /etc/default/locale
RUN echo "LANGUAGE=zh_CN:zh" >> /etc/default/locale
RUN echo "LC_ALL=zh_CN.UTF-8" >> /etc/default/locale
RUN echo "LC_ALL=zh_CN.UTF-8" >> /etc/environment
RUN dpkg-reconfigure locales
RUN update-locale zh_CN.UTF-8
RUN apt-get install -y openssh-server
RUN mkdir -p /var/run/sshd

ENV USER root
ENV PASSWD 123456

# 设置root ssh远程登录密码为123456
RUN echo "$USER:$PASSWD" | chpasswd 

# 容器需要开放SSH 22端口
EXPOSE 22


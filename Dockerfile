FROM ubuntu:16.04

RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Update sources
RUN apt-get update -y
RUN yum install -y wget
RUN wget http://dl.wdlinux.cn/files/lanmp_v3.2.tar.gz
RUN tar zxvf lanmp_v3.2.tar.gz
RUN sh lanmp.sh & 2&

COPY src/start.sh /start.sh
RUN chmod a+x /start.sh

EXPOSE 80 443 8080
CMD ["/start.sh"]

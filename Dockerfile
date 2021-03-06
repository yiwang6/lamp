FROM ubuntu:16.04

COPY ./src/start.sh /start.sh

RUN apt-get install -y wget \
    && wget http://dl.wdlinux.cn/files/lanmp_v3.2.tar.gz \
    && tar zxvf lanmp_v3.2.tar.gz \
    && sed -i 's/read -p "Please Input 1,2,3,4,5: " SERVER_ID/SERVER_ID=2/g' lanmp.sh \
    && chmod +x /start.sh \
    && sh lanmp.sh

EXPOSE 80 8080

CMD ["/start.sh"]

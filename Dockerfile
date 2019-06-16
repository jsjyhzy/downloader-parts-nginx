FROM ubuntu:18.04

ENV ARIANG_VERSION=1.1.1

VOLUME [ "/config" ]

RUN apt-get update &&\
    apt-get install nginx gettext-base unzip wget ca-certificates -y &&\
    wget https://github.com/mayswind/AriaNg/releases/download/${ARIANG_VERSION}/AriaNg-${ARIANG_VERSION}.zip -O ariang.zip &&\
    rm -r /var/www/html && mkdir /var/www/html &&\
    systemctl disable nginx && systemctl stop nginx &&\
    unzip -o ariang.zip -d /var/www/html

COPY startup.sh .

COPY server.template .

ENTRYPOINT [ "bash", "startup.sh" ]
FROM ubuntu:18.04

ENV ARIANG_VERSION=1.1.1

VOLUME [ "/config" ]

RUN apt-get update &&\
    apt-get install nginx gettext-base unzip wget ca-certificates -y &&\
    wget https://github.com/mayswind/AriaNg/releases/download/${ARIANG_VERSION}/AriaNg-${ARIANG_VERSION}.zip -O ariang.zip &&\
    rm -r /var/www/html && mkdir /var/www/html &&\
    unzip -o ariang.zip -d /var/www/html &&\
    ln -sf /dev/stdout /var/log/nginx/access.log &&\
    ln -sf /dev/stderr /var/log/nginx/error.log

COPY startup.sh .

COPY server.template .

EXPOSE 80

ENTRYPOINT [ "bash", "startup.sh" ]
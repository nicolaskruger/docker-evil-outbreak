FROM ubuntu:25.04

COPY ./bioserv1 ./bioserv1
COPY ./bioserv2 ./bioserv2

EXPOSE 3045

RUN apt-get update
RUN apt-get install -y make
RUN apt-get install -y gcc
RUN apt-get install -y dnsmasq
RUN apt-get update && apt-get install -y dnsutils
RUN apt-get install -y unzip
RUN apt-get update && apt-get install -y php
RUN apt-get install mariadb-server -y
RUN apt-get install openjdk-21-jdk -y
RUN apt-get install default-jdk -y

RUN apt-get install wget -y
RUN wget https://www.openssl.org/source/openssl-1.0.2q.tar.gz && \
    tar -xvzf openssl-1.0.2q.tar.gz && \
    cd openssl-1.0.2q && \
    ./config --prefix=/opt/openssl-1.0.2 \
             --openssldir=/etc/ssl \
             shared \
             enable-weak-ssl-ciphers \
             enable-ssl3 \
             enable-ssl3-method \
             enable-ssl2 \
             -Wl,-rpath=/opt/openssl-1.0.2/lib && \
    make && make install
RUN /opt/openssl-1.0.2/bin/openssl ciphers -V 'ALL' | grep 0x13
RUN sed -ie '1i\\n/opt/openssl-1.0.2/lib\n' /etc/ld.so.conf.d/x86_64-linux-gnu.conf
RUN ldconfig
RUN apt-get update
RUN apt-get install libpcre3 -y libpcre3-dev -y
RUN apt-get install libexpat1 -y libexpat1-dev -y libxml2 -y libxml2-dev -y libxslt1-dev -y libxslt1.1

RUN wget https://dlcdn.apache.org/httpd/httpd-2.4.63.tar.gz && \
    tar xzvf httpd-2.4.63.tar.gz &&\
    cd httpd-2.4.63/srclib/ && \
        wget https://dlcdn.apache.org/apr/apr-1.7.5.tar.gz && \
        wget https://dlcdn.apache.org/apr/apr-util-1.6.3.tar.gz && \
        tar xzvf apr-1.7.5.tar.gz && \
        tar xzvf apr-util-1.6.3.tar.gz && \        
        ln -s apr-1.7.5 apr && \
        ln -s apr-util-1.6.3 apr-util
CMD []

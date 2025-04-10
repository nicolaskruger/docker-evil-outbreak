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

RUN wget https://www.openssl.org/source/openssl-1.0.2q.tar.gz
RUN tar xzvf openssl-1.0.2q.tar.gz
RUN cd openssl-1.0.2q
RUN ./config --prefix=/opt/openssl-1.0.2 --openssldir=/etc/ssl shared enable-weak-ssl-ciphers enable-ssl3 enable-ssl3-method enable-ssl2 -Wl,-rpath=/opt/openssl-1.0.2/lib
RUN make depend 
RUN make install
RUN /opt/openssl-1.0.2/bin/openssl ciphers -V 'ALL' | grep 0x13
RUN cd ..

CMD []

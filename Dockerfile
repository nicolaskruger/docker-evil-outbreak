FROM ubuntu:22.04

COPY ./bioserv1 ./bioserv1
COPY ./bioserv2 ./bioserv2

EXPOSE 3045

RUN apt-get update
RUN apt-get install make

CMD []

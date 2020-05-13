FROM ubuntu:16.04

RUN apt-get update -yq
RUN apt-get install -yq libcpan-mini-perl
RUN apt-get install -yq cpanminus
RUN apt-get install -yq build-essential

RUN cpanm --mirror "http://mirrors.163.com/cpan" CPAN::Mini::Webserver

COPY minicpanrc /root/.minicpanrc

VOLUME /cpan
EXPOSE 8080


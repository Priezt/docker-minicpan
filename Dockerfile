FROM ubuntu:16.04

MAINTAINER priezt

RUN apt-get update -yq
RUN apt-get install -yq libcpan-mini-perl
RUN apt-get install -yq cpanminus
RUN apt-get install -yq build-essential

#RUN cpanm --mirror "http://mirrors.163.com/cpan" CPAN::Mini::Webserver

COPY minicpanrc /root/.minicpanrc
COPY update.sh /root/update.sh
COPY nginx.conf /root/nginx.conf

RUN apt-get install -yq nginx
RUN rm /etc/nginx/sites-enabled/default
RUN ln -s /root/nginx.conf /etc/nginx/sites-enabled/minicpan
RUN cd /etc/nginx && sed -i.bak 's/^user.*/user root;/' nginx.conf

WORKDIR /root

VOLUME /cpan
#EXPOSE 8080
EXPOSE 80

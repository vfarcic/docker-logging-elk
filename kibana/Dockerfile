FROM ubuntu:14.04
MAINTAINER Viktor Farcic "viktor@farcic.com"

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install wget nginx-full && \
    apt-get -y autoremove && \
    apt-get clean all

ENV VERSION 4.0.2
RUN wget https://download.elastic.co/kibana/kibana/kibana-$VERSION-linux-x64.tar.gz && \
    tar zxvf kibana-$VERSION-linux-x64.tar.gz && \
    rm kibana-$VERSION-linux-x64.tar.gz && \
    mv kibana-$VERSION-linux-x64/* /usr/share/nginx/html && \
    rm -rf kibana-$VERSION

EXPOSE 80
CMD ["nginx", "-g", "'daemon off;'"]

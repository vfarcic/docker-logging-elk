FROM ubuntu:14.04
MAINTAINER Viktor Farcic "viktor@farcic.com"

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install wget && \
    apt-get -y autoremove && \
    apt-get clean all

ENV VERSION 4.0.2
RUN wget https://download.elastic.co/kibana/kibana/kibana-$VERSION-linux-x64.tar.gz && \
    tar zxvf kibana-$VERSION-linux-x64.tar.gz && \
    rm kibana-$VERSION-linux-x64.tar.gz && \
    mkdir /kibana && \
    mv kibana-$VERSION-linux-x64/* /kibana/.

ADD start.sh /kibana/start.sh

EXPOSE 5601
CMD ["/kibana/start.sh"]

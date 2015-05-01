FROM ubuntu:14.04
MAINTAINER Viktor Farcic "viktor@farcic.com"

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install wget openjdk-7-jdk && \
    apt-get -y autoremove && \
    apt-get clean all

WORKDIR /opt
ENV VERSION 1.5.2
RUN wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-$VERSION.tar.gz && \
    tar zxvf elasticsearch-$VERSION.tar.gz && \
    rm elasticsearch-$VERSION.tar.gz && \
    ln -s /opt/elasticsearch-$VERSION elasticsearch && \
    cd elasticsearch && \
    bin/plugin -install lmenezes/elasticsearch-kopf

WORKDIR /opt/elasticsearch
EXPOSE 9200
EXPOSE 9300
CMD ["bin/elasticsearch"]

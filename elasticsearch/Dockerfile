FROM ubuntu:14.04
MAINTAINER Viktor Farcic "viktor@farcic.com"

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install wget openjdk-7-jdk && \
    apt-get -y autoremove && \
    apt-get clean all

WORKDIR /opt
RUN wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.1.1.tar.gz && \
    tar zxvf elasticsearch-1.1.1.tar.gz && \
    rm elasticsearch-1.1.1.tar.gz && \
    ln -s /opt/elasticsearch-1.1.1 elasticsearch && \
    cd elasticsearch && \
    bin/plugin -install lmenezes/elasticsearch-kopf

WORKDIR /opt/elasticsearch
EXPOSE 9200
CMD ["bin/elasticsearch"]

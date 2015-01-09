FROM ubuntu:14.04
MAINTAINER Viktor Farcic "viktor@farcic.com"

# Common
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install wget openjdk-7-jdk && \
    apt-get -y autoremove && \
    apt-get clean all
WORKDIR /
RUN wget https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz && \
    tar zxvf logstash-1.4.2.tar.gz && \
    rm logstash-1.4.2.tar.gz
RUN ln -s logstash-1.4.2 ls

EXPOSE 514 514/udp 9200 9292 9300
WORKDIR /ls
CMD ["bin/logstash", "-f", "logstash.conf"]

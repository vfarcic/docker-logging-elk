FROM ubuntu:14.04
MAINTAINER Viktor Farcic "viktor@farcic.com"

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install wget nginx-full && \
    apt-get -y autoremove && \
    apt-get clean all

RUN wget https://download.elasticsearch.org/kibana/kibana/kibana-3.1.2.tar.gz && \
    tar zxvf kibana-3.1.2.tar.gz && \
    rm kibana-3.1.2.tar.gz && \
    mv kibana-3.1.2/* /usr/share/nginx/html && \
    rm -rf kibana-3.1.2

EXPOSE 80
CMD ["nginx -g 'daemon off;'"]

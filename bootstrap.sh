#!/bin/bash

# ElasticSearch
export DATA_DIR=/tmp/data
export PORT=9200
sudo docker build -t vfarcic/elasticsearch .
sudo docker run -d --name elasticsearch \
  -v $DATA_DIR:/opt/elasticsearch/data \
  -p $PORT:9200 \
  vfarcic/elasticsearch
sudo docker rm -f elasticsearch

# LogStash
export CONF_PATH=/home/vfarcic/IdeaProjects/monitoring/logstash/logstash.conf
export LOGS_DIR=/home/vfarcic/IdeaProjects/monitoring/logstash/logs
sudo docker build -t vfarcic/logstash .
sudo docker run -d --name logstash \
  --link elasticsearch:db \
  -v $CONF_PATH:/opt/logstash/logstash.conf \
  -v $LOGS_DIR:/opt/logstash/logs \
  vfarcic/logstash
sudo docker rm -f logstash

# Kibana
export CONF_PATH=/home/vfarcic/IdeaProjects/monitoring/logstash/logstash.conf
sudo docker build -t vfarcic/kibana .
sudo docker run -it --name kibana \
  -p 9201:80 \
  --link elasticsearch:db \
  vfarcic/kibana /bin/bash
sudo docker rm -f kibana

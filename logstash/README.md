LogStash
========

To build:

```bash
sudo docker build -t vfarcic/logstash .
```

To run LogStash:

```bash
export CONF_PATH=$PWD/logstash.conf
export LOGS_DIR=$PWD/logs
export PATTERNS_DIR=$PWD/patterns
sudo docker run -d --name logstash \
  -v $CONF_PATH:/ls/logstash.conf \
  -v $LOGS_DIR:/ls/logs \
  -v $PATTERNS_DIR:/ls/patterns \
  -p 5000:5000 \
  vfarcic/logstash
```

To run LogStash linked to the ElasticSearch container:

```bash
export CONF_PATH=$PWD/logstash.conf
export LOGS_DIR=$PWD/logs
export PATTERNS_DIR=$PWD/patterns
sudo docker run -d --name logstash \
  --link elasticsearch:db \
  -v $CONF_PATH:/ls/logstash.conf \
  -v $LOGS_DIR:/ls/logs \
  -v $PATTERNS_DIR:/ls/patterns \
  vfarcic/logstash
```

To output Docker logs to syslog and from there to LogStash (works only in Docker 1.6+):

```bash
# SysLog
echo "*.* @localhost:25826" | sudo tee /etc/rsyslog.d/10-logstash.conf
sudo service rsyslog restart

# ElasticSearch
export DATA_DIR=/data/elasticsearch
export ES_PORT=9200
sudo docker run -d --name elasticsearch \
  -v $DATA_DIR:/opt/elasticsearch/data \
  -p $ES_PORT:9200 \
  vfarcic/elasticsearch
curl http://localhost:${ES_PORT}/_search?pretty
  
# LogStash
export CONF_PATH=$PWD/syslog.conf
sudo docker run -d --name logstash \
  --link elasticsearch:db \
  -v $CONF_PATH:/ls/logstash.conf \
  -p 25826:25826 \
  -p 25826:25826/udp \
  vfarcic/logstash
sudo docker logs -f logstash
  
# Start a container that produces some logs to stdout/stderr
sudo docker run -d --name bdd \
  -p 9000:9000 \
  --log-driver=syslog \
  vfarcic/bdd
sudo docker logs -f logstash
curl http://localhost:${ES_PORT}/_search?pretty
  
# Kibana
export KIBANA_PORT=9201
sudo docker run -d --name kibana \
  -p $KIBANA_PORT:5601 \
  --link elasticsearch:db \
  vfarcic/kibana
# Open http://localhost:9201 in browser

# TODO: Kibana instructions
# TODO: Export Kibana settings
# TODO: rsyslog to remote server
```
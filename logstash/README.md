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

To output Docker logs to syslog and from there to LogStash:

```bash
vagrant up elk-docker
```

Open http://localhost:5601 in browser

TODO: Rewrite Vagrantfile to bash
TODO: Export Kibana settings
TODO: Try rsyslog to remote server
